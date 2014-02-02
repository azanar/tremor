require File.expand_path('../../test_helper', __FILE__)

require 'ingestion/poller/usgs'

class Tremor::Ingestion::Test < Test::Unit::TestCase
  test "ingestion pipeline" do
   if false 
    usgs = Tremor::Ingestion::Poller::USGS.new

    result = usgs.poll

    result.each do |r|
      assert_kind_of Tremor::Ingestion::Quake, r
    end
   end
  end
end
