require 'date'

module Tremor
  module Ingestion
    class Quake
      def initialize(line)
        @id = line[11]
        @magnitude = line[3]
        @latitude = line[1]
        @longitude = line[2]
        @time = DateTime.parse(line[0])
      end

      attr_reader :id
      attr_reader :magnitude
      attr_reader :latitude
      attr_reader :longitude
      attr_reader :time
    end
  end
end
