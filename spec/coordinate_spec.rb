require File.join(File.dirname(__FILE__), 'spec_helper.rb')

describe Coordinate do
  subject do
    Coordinate.new(1,2)
  end

  it "should be able to tell you the x coordinate" do
    subject.x.should == 1
  end

  it "should be able to tell you the y coordinate" do
    subject.y.should == 2
  end

  it "should be able to do basic addition of coordinates together" do
    (subject + Coordinate.new(3,4)).should == Coordinate.new(4,6)
  end

  it "should be able to compare different coordinates together" do
    subject.should == Coordinate.new(subject.x, subject.y)
  end

  it "Should be able to return the coordinate immediately north" do
    subject.north.should == Coordinate.new(subject.x, subject.y - 1)
  end

  it "Should be able to return the coordinate immediately south" do
    subject.south.should == Coordinate.new(subject.x, subject.y + 1)
  end

  it "Should be able to return the coordinate immediately east" do
    subject.east.should == Coordinate.new(subject.x + 1, subject.y)
  end

  it "Should be able to return the coordinate immediately west" do
    subject.west.should == Coordinate.new(subject.x - 1, subject.y)
  end
end
