require File.join(File.dirname(__FILE__), 'spec_helper.rb')

describe GameMap do
  subject do
    GameMap.new(".......#1...........\n" +
                ".......#####........\n" +
                "...........#........\n" +
                ".......##..#........\n" +
                "....2#.##..##.......\n" +
                ".....#.#............\n" +
                ".....###............\n" +
                "....................\n" +
                "...##########3......\n" +
                "....................\n")
  end

  it "should be able to tell you how high it is" do
    subject.height.should == 10
  end

  it "should be able to tell you how wide it is" do
    subject.width.should == 20
  end

  it "should be able to tell you the coordinates of the player" do
    subject.player.x.should == 8
    subject.player.y.should == 0
  end

  describe "opponents" do
    it "should have two opponents" do
      subject.opponents.length.should == 2
    end

    it "should be able to to tell you the coordinate of the first player" do
      subject.opponents.first.x.should == 4
      subject.opponents.first.y.should == 4
    end

    it "should be able to to tell you the coordinate of the second player" do
      subject.opponents.last.x.should == 13
      subject.opponents.last.y.should == 8
    end
  end

  it "should be able to tell you if a coordinate is empty" do
    subject.coordinate_is_empty?(Coordinate.new(0,0)).should be
    subject.coordinate_is_empty?(Coordinate.new(7,0)).should_not be
    subject.coordinate_is_empty?(Coordinate.new(8,0)).should_not be
  end

  it "should be able to tell you if a coordinate is valid" do
    subject.coordinate_is_valid?(Coordinate.new(-1,-1)).should_not be
    subject.coordinate_is_valid?(Coordinate.new(0,0)).should be
    subject.coordinate_is_valid?(Coordinate.new(19,9)).should be
    subject.coordinate_is_valid?(Coordinate.new(20,10)).should_not be
  end
end
