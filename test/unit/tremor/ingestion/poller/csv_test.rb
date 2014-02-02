require File.expand_path('../../../../test_helper', __FILE__)

require 'ingestion/poller/csv'

class Tremor::Ingestion::Poller::Test < Test::Unit::TestCase
  test "#poll" do
    csv = Tremor::Ingestion::Poller::CSV.new("foo")

    mock_response = mock
    HTTParty.expects(:get).with("foo").returns(mock_response)
    mock_response.expects(:body).returns("a,b,c\nd,e,f")

    assert_equal [["a", "b", "c"], ["d", "e", "f"]], csv.poll
  end
end
