require 'app/earthquakes/query'
require 'models/quake'

require 'json'

get '/earthquakes.json' do
  logger.info "RUNNING"

  query = Tremor::Earthquakes::Query.new(params)

  quakes = query.run

  result = quakes.map { |r| r.values }

  JSON.dump(result)
end
