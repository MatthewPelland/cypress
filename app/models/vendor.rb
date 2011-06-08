class Vendor

  include Mongoid::Document

  # Vendor Details
  field :name, type: String
  field :poc, type: String
  field :tel, type: String
  field :email, type: String
  
  # Proctor Details
  field :proctor, type: String
  field :proctor_tel, type: String
  field :proctor_email, type: String
  
  # Test Details
  field :effective_date, type: Integer
  field :measure_ids, type: Array
  field :patient_gen_job, type: String
  field :reported_results, type: Hash

  # Get the measure definitions for the selected measures. For multinumerator
  # measures this will include all sub measures so measure_defs.size may not be
  # the same as measure_ids.size
  def measure_defs
    measure_ids.collect do |measure_id|
      Measure.where(id: measure_id).order_by([[:sub_id, :asc]]).all()
    end.flatten
  end
  
  # Get the reported result for a particular key (e.g. '0038c')
  def reported_result(key)
    default = {'numerator'=>'--', 'denominator'=>'--', 'exclusions'=>'--'}
    return default if reported_results==nil
    reported_results[key] || default
  end
  
  # Get the expected results for all selected measures
  def expected_results
    measure_defs.collect do |measure|
      expected_result(measure)
    end
  end
  
  # Get the expected result for a particular measure
  def expected_result(measure)
    Cypress::MeasureEvaluator.eval(self, measure)
  end
  
  # Compare the supplied expected results to the reported results and return true
  # if all match, false otherwise
  def passing?
    expected_results.size==count_passing
  end
  
  # Compare the expected results to the stroed reported results and return the
  # count that match
  def count_passing
    passing = expected_results.select do |result|
      passed?(result)
    end
    passing.count
  end
  
  # Compare the supplied expected result to the resported result and return true
  # if all figures match, false otherwise
  def passed?(expected_result)
    passed = true
    reported_result = reported_result(expected_result['key'])
    ['denominator', 'numerator', 'exclusions'].each do |component|
      if reported_result[component] != expected_result[component]
        passed = false
      end
    end
    passed
  end
  
end