module Tremor
  module Ingestion
    class Merger
      def initialize(mapper, key_column, key)
        @mapper = mapper
        @key_column = key_column
        @key = key
        @model_klass = mapper.mapped_model
      end

      def save_if_not_exists
        if not exists?
          save
        end
      end

      def exists?
        @model_klass[@key_column.to_sym => @key]
      end

      def save
        to_sequel.save
      end

      private

      def to_sequel
        @sequel ||= @mapper.to_sequel
      end
    end
  end
end
