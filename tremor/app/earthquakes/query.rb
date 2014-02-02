require 'app/earthquakes/scopes'
require 'models/quake'

module Tremor
  module Earthquakes
    class Query
      PARAM_SCOPES = {
        "near" => Tremor::Earthquakes::Scope::Near,
        "on" => Tremor::Earthquakes::Scope::On,
        "over" => Tremor::Earthquakes::Scope::Over,
        "since" => Tremor::Earthquakes::Scope::Since
      }

      def initialize(params)
        actionable_params = params.keep_if do |p, v|
          PARAM_SCOPES.keys.include?(p)
        end

        scopes = actionable_params.map do |p, v|
          PARAM_SCOPES[p].new(v)
        end

        dataset = Tremor::Models::Quake.dataset

        @scoped_dataset = scopes.inject(dataset) do |dataset, scope|
          scope.apply(dataset)
        end
      end

      def run
        @scoped_dataset.all
      end
    end
  end
end
