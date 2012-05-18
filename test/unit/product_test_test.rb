require 'test_helper'
require 'zip/zip'

class ProductTestTest < ActiveSupport::TestCase
  setup do
    collection_fixtures('test_executions', '_id', "product_test_id")
    collection_fixtures('product_tests', '_id')
    
    @test1 = ProductTest.find("4f58f8de1d41c851eb000478")
    @test2 = ProductTest.find("4f5a606b1d41c851eb000484")
  end

  test "Should know if its passing" do
    assert @test1.passing?
    assert !@test2.passing?
  end
  
  test "Should return its executions in order" do
    e1 = @test1.ordered_executions
    
    assert e1[0]._id.to_s == "4f5900981d41c851eb000482"
    assert e1[1]._id.to_s == "4f5900161d41c851eb000481"
  end
  
  test "Should return the measure defs" do
    defs = @test1.measure_defs
    
    assert defs[0].key == "0001"
    assert defs[1].key == "0002"
  end
  
  test "Should know how many measures its testing" do
    assert @test1.count_measures == 2
  end
  
  test "Should report if patient pop is imported" do
    assert @test1.imported_population? == true
    
  end

  test "generate records file" do
    test = ProductTest.find("4f58f8de1d41c851eb000478")
    
    # Check that we get the appropriate file for every format we generate
    formats = ["c32", "ccr", "csv", "html"]
    formats.each do |format|
      # Make sure we're at least creating some sort of file
      file = test.generate_records_file(format)
      assert !file.nil?

      # A very rough check to see if we get the right type of file      
      if format == 'csv'
        # CSV should contain actual text of a record
        assert_match(/Rachel,Mendez/, file.read)
      else
        # Other formats should return a zip with patient records
        zip = Zip::ZipFile.new(file.path)
        if format == 'html'
          assert zip.find_entry("0_Rachel_Mendez.html")
        else
          assert zip.find_entry("0_Rachel_Mendez.xml")
        end
      end
      
      file.close
      file.unlink
    end
  end
end