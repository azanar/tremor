module Tremor
module Scope
class Near
  DISTANCE_BOUND = 5
  def initialize(point)
    coords = point.split(",")
    @x = coords[0]
    @y = coords[1]
  end

  def apply(dataset)
    point = Sequel.function(:point, @x.to_f, @y.to_f)
    function = Sequel.function(:quake_distances_from_point, point)
    dataset.join(function, "d.quake_id = quakes.id", :table_alias => :d).where("d.distance < 5")
  end
end
end
end
