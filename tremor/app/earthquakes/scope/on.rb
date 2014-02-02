require 'date'

module Tremor
module Earthquakes
module Scope
class On
  def initialize(seconds)
    @date = Time.at(seconds.to_i).utc.to_date
  end

  def apply(dataset)
    dataset.where("date(time AT TIME ZONE 'UTC') = ?", @date)
  end
end
end
end
end
