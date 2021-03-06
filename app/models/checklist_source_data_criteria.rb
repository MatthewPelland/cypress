class ChecklistSourceDataCriteria
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include Mongoid::Timestamps

  embedded_in :checklist_test

  field :measure_id, type: String
  field :source_data_criteria, type: String # this is the name of the source_data_criteria

  field :completed, type: Boolean
  field :code, type: String
  field :attribute_code, type: String

  validate :code_matches_valueset?
  validate :attribute_code_matches_valueset?

  def attribute_code_matches_valueset?
    # validate if an attribute_code is required, and the completed box is checked
    if attribute_code && completed
      measure = Measure.find_by(_id: measure_id)
      criteria = measure.hqmf_document[:data_criteria].select { |key| key == source_data_criteria }.values.first
      valueset = [criteria[:field_values].values[0].code_list_id]
      errors.add(:attribute_code, 'Code must be from valueset listed.') unless code_in_valuesets(valueset, attribute_code)
    end
  end

  def code_matches_valueset?
    # validate if an code is required, and the completed box is checked
    if code && completed
      valuesets = get_all_valuesets_for_dc(measure_id)
      errors.add(:code, 'Code must be from valueset listed.') unless code_in_valuesets(valuesets, code)
    end
  end

  # goes through all data criteria in a measure to find valuesets that have the same type, status and field values
  def get_all_valuesets_for_dc(measure_id)
    measure = Measure.find_by(_id: measure_id)
    criteria = measure.hqmf_document[:data_criteria].select { |key| key == source_data_criteria }.values.first
    arr = []
    # if criteria is a characteristic, only return a single valueset
    if criteria['type'] == 'characteristic'
      arr << criteria.code_list_id
    else
      valuesets = measure.all_data_criteria.map { |data_criteria| include_valueset(data_criteria, criteria) }
      valuesets.uniq.each do |valueset|
        arr << valueset unless valueset.nil?
      end
    end
    arr
  end

  # data_criteria is from the measure defintion, criteria is for the specific checklist test
  def include_valueset(data_criteria, criteria)
    include_vset = false
    if data_criteria.type.to_s == criteria['type'] && data_criteria.status == criteria['status']
      # if the criteria has a field_value, check it is the same as the data_criteria, else return true
      include_vset = if criteria['field_values']
                       compare_field_values(data_criteria, criteria)
                     else
                       true
                     end
    end
    data_criteria.code_list_id if include_vset
  end

  # data_criteria is from the measure defintion, criteria is for the specific checklist test
  def compare_field_values(data_criteria, criteria)
    include_vset = false
    if data_criteria.field_values && criteria['field_values'].keys[0] == data_criteria.field_values.keys[0]
      if data_criteria.field_values.values[0].type == 'CD'
        if data_criteria.field_values.values[0].code_list_id == criteria['field_values'].values[0]['code_list_id']
          include_vset = true
        end
      else
        include_vset = true
      end
    end
    include_vset
  end

  # searches an array of valuesets for a code
  def code_in_valuesets(valuesets, input_code)
    !HealthDataStandards::SVS::ValueSet.where('concepts.code' => input_code).in(oid: valuesets).empty?
  end
end
