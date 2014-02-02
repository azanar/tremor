require 'ingestion/merger'
require 'models/quake'

module Tremor
  module Ingestion
    module Mapper
      class Quake
        def initialize(ingested)
          @ingested = ingested
        end

        def to_merger
          Tremor::Ingestion::Merger.new(self, :usgsid, @ingested.id)
        end

        def mapped_model
          Tremor::Models::Quake
        end

        def to_sequel
          mapped_model.new(
            :usgsid => @ingested.id,
            :magnitude => @ingested.magnitude,
            :latitude => @ingested.latitude,
            :longitude => @ingested.longitude,
            :time => @ingested.time
          )
        end
      end
    end
  end
end
