class GameMap
  attr_reader :map, :width, :height, :player, :opponents

  def initialize(game_map)
    @map = game_map.split("\n")
    @width = map.first.length
    @height = map.length
    @player = find_player
    @opponents = find_opponents
  end

  def find_player
    find_coordinate!("1")
  end

  def find_opponents
    [].tap do |opponents|
      i = 2
      while (coordinate = find_coordinate(i))
        opponents << coordinate
        i += 1
      end
    end
  end

  def coordinate_is_empty?(coordinate)
    self[coordinate] == "."
  end

  def [](coordinate)
    map[coordinate.y] and map[coordinate.y][coordinate.x]
  end

  private

  def find_coordinate(character)
    map.each_with_index do |row, y|
      x = row.index(character.to_s)
      if x then
        return Coordinate.new(x,y)
      end
    end

    return nil
  end

  def find_coordinate!(character)
    find_coordinate(character) or raise ArgumentError, "This map doesn't have a #{character.inspect}"
  end
end
