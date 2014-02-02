require 'app/earthquakes/scopes'
require 'models/quake'

require 'json'

param_scopes = {
  "near" => Tremor::Scope::Near,
  "on" => Tremor::Scope::On,
  "over" => Tremor::Scope::Over,
  "since" => Tremor::Scope::Since
}

get '/earthquakes.json' do
  logger.info "RUNNING"
  actionable_params = params.keep_if do |p, v|
    param_scopes.keys.include?(p)
  end
  
  scopes = actionable_params.map do |p, v|
    param_scopes[p].new(v)
  end

  dataset = Tremor::Models::Quake.dataset

  scoped_dataset = scopes.inject(dataset) do |dataset, scope|
    scope.apply(dataset)
  end

  logger.info scoped_dataset.sql

  result = scoped_dataset.all.map { |r| r.values }

  JSON.dump(result)
  
end
