require File.expand_path('../../../../test_helper', __FILE__)

require 'ingestion/mapper/quake'

class Tremor::Ingestion::Mapper::Quake::Test < Test::Unit::TestCase
  test "#to_sequel" do
    mock_quake = mock
    attributes = {
      :id => "abc123", 
      :magnitude => 10.5, 
      :latitude => 12.345, 
      :longitude => 12.345, 
      :time => Time.now
    }

    attributes.each do |attr, val|
      mock_quake.expects(attr).returns(val)
    end

    m = Tremor::Ingestion::Mapper::Quake.new(mock_quake)

    res = m.to_sequel

    mapped_attributes = attributes.merge(:usgsid => attributes[:id])
    mapped_attributes.delete(:id)

    assert_kind_of Tremor::Models::Quake, res

    mapped_attributes.each do |attr, val|
      assert_equal res[attr], val, "Attribute #{attr} should have been #{val.class}, was instead #{res[attr].class}"
    end
  end
end
