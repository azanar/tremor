require 'ingestion/poller/csv'
require 'ingestion/quake'

module Tremor
  module Ingestion
    class Poller
      class USGS
        def initialize
          @poller = Tremor::Ingestion::Poller::CSV.new("http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_week.csv")
        end

        def poll
          arr = @poller.poll
          data_rows = arr.drop(1) #header row
          data_rows.map do |r|
            Tremor::Ingestion::Quake.new(r)
          end
        end
      end
    end
  end
end
