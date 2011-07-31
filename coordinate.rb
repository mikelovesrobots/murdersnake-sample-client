class Coordinate
  attr_accessor :x, :y

  def initialize(x,y)
    @x = x
    @y = y
  end

  def +(other)
    Coordinate.new(x + other.x, y + other.y)
  end

  def ==(other)
    if other.respond_to? "x" and other.respond_to? "y"
      x == other.x and y == other.y
    else
      super
    end
  end

  def north
    self + Coordinate.north
  end

  def south
    self + Coordinate.south
  end

  def east
    self + Coordinate.east
  end

  def west
    self + Coordinate.west
  end

  def self.north
    Coordinate.new(0, -1)
  end

  def self.south
    Coordinate.new(0, 1)
  end

  def self.east
    Coordinate.new(1, 0)
  end

  def self.west
    Coordinate.new(-1, 0)
  end

end
