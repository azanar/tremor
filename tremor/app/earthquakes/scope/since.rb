module Tremor
module Scope
class Since
  def initialize(datestamp)
    @datestamp = datestamp
  end

  def apply(dataset)
    dataset
  end
end
end
end

