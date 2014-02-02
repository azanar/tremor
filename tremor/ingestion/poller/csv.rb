require 'csv'
require 'httparty'

module Tremor
module Ingestion
  class Poller
    class CSV
      def initialize(url)
        @url = url
      end
      def poll
        response = HTTParty.get(@url)
        ::CSV.parse(response.body)
      end
    end
  end

end
end
