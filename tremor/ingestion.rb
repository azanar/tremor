require 'ingestion/poller/usgs'
require 'ingestion/mapper/quake'

module Tremor
module Ingestion
  def self.run
    usgs_quakes = Tremor::Ingestion::Poller::USGS.new.poll

    mappers = usgs_quakes.map { |q| Tremor::Ingestion::Mapper::Quake.new(q) }

    quakes = mappers.map { |m| m.to_merger }

    quakes.each do |q|
      q.save_if_not_exists
    end
  end
end
end
