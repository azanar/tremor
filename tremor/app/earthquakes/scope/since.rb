module Tremor
module Earthquakes
module Scope
class Since
  def initialize(timestamp)
    @timestamp = Time.at(timestamp.to_i).utc
  end

  def apply(dataset)
    dataset.where("(time AT TIME ZONE 'UTC') > ?", @timestamp)
  end
end
end
end
end
