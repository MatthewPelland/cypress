module Cypress
  class CriteriaPicker
    def self.races(record, _options = {})
      [record.race['code']]
    end

    def self.ethnicities(record, _options = {})
      [record.ethnicity['code']]
    end

    def self.genders(record, _options = {})
      [record.gender]
    end

    def self.payers(record, _options = {})
      [record.insurance_providers.first.name]
    end

    def self.age(record, options = {})
      age = record.age_at(options[:effective_date])

      # select min or max randomly
      # if max, shift age criteria up, if min shift age down
      # ex, the patient is 33, if we pick min set it to 30, if max set it to 36

      min_age = age - rand(2..10)
      max_age = age + rand(2..10)

      return { max: max_age } if min_age <= 1

      [{ min: min_age }, { max: max_age }].sample
    end

    def self.providers(record, options = {})
      record.lookup_provider(options[:incl_addr])
    end

    def self.problems(_record, options = {})
      problem_oid = lookup_problem(options[:measures], options[:records])
      { oid: [problem_oid], hqmf_ids: hqmf_oids_for_problem(problem_oid, options[:measures]) }
    end

    def self.lookup_problem(measures, records)
      measure = measures.first
      code_list_id = fallback_id = ''
      # determine which data criteira are diagnoses, and make sure we choose one that one of our records has
      # if we can't find one that matches a record, just use any diagnosis
      measure.hqmf_document.source_data_criteria.each do |_criteria, criteria_hash|
        next unless criteria_hash.definition.eql? 'diagnosis'
        fallback_id = criteria_hash.code_list_id
        hqmf_oid = HQMF::DataCriteria.template_id_for_definition(criteria_hash.definition, criteria_hash.status, criteria_hash.negation)
        if Cypress::RecordFilter.filter(records, { 'problems' => { oid: [criteria_hash.code_list_id], hqmf_ids: [hqmf_oid] } }, {}).count > 0
          code_list_id = criteria_hash.code_list_id
          break
        end
      end

      code_list_id.empty? ? fallback_id : code_list_id
    end

    def self.hqmf_oids_for_problem(problem_oid, measures)
      measure = measures.first
      hqmf_oids = []
      measure.hqmf_document.source_data_criteria.each do |_criteria, criteria_hash|
        next unless criteria_hash.key?('code_list_id') && criteria_hash.code_list_id == problem_oid
        hqmf_oids << HQMF::DataCriteria.template_id_for_definition(criteria_hash.definition, criteria_hash.status, criteria_hash.negation)
      end
      hqmf_oids.uniq
    end
  end
end
