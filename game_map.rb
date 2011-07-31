class GameMap
  attr_reader :width, :height, :player, :opponents

  def initialize(map)
    rows = map.split("\n")
    @width = rows.first.length
    @height = rows.length
    @player = find_player(rows)
    @opponents = find_opponents(rows)
  end

  def find_player(rows)
    find_coordinate!(rows, "1")
  end

  def find_opponents(rows)
    [].tap do |opponents|
      i = 2
      while (coordinate = find_coordinate(rows, i))
        opponents << coordinate
        i += 1
      end
    end
  end

  private
  def find_coordinate(rows, character)
    rows.each_with_index do |row, y|
      x = row.index(character.to_s)
      if x then
        return Coordinate.new(x,y)
      end
    end

    return nil
  end

  def find_coordinate!(rows, character)
    find_coordinate(rows, character) or raise ArgumentError, "This map doesn't have a #{character.inspect}"
  end
end


class Coordinate
  attr_accessor :x, :y

  def initialize(x,y)
    @x = x
    @y = y
  end
end
