module Tremor
module Scope
class Over
  def initialize(magnitude)
    @magnitude = magnitude
  end

  def apply(dataset)
    dataset.where("magnitude > ?", @magnitude)
  end
end
end
end


