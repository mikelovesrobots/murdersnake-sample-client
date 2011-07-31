class AI
  attr_reader :map

  def initialize(map)
    @map = map
  end

  def move
    [
     [map.player.north, "n"],
     [map.player.west, "w"],
     [map.player.south, "s"]
    ].each do |coordinate, dir|
      return dir if map.coordinate_is_empty?(coordinate)
    end

    "e"
  end
end
