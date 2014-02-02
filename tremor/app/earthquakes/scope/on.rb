module Tremor
module Scope
class On
  def initialize(datestamp)
    @datestamp = datestamp
  end

  def apply(dataset)
    dataset.where
  end
end
end
end
