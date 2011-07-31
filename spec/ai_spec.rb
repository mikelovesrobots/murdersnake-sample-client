require File.join(File.dirname(__FILE__), 'spec_helper.rb')

describe AI do
  describe "unobstructed" do

    subject do
      map = GameMap.new("...\n" +
                        ".1.\n" +
                        "...\n")
      AI.new(map)
    end

    it "should travel north" do
      subject.move.should == "n"
    end
  end

  describe "when north is blocked" do
    subject do
      map = GameMap.new(".#.\n" +
                        ".1.\n" +
                        "...\n")
      AI.new(map)
    end

    it "should travel west" do
      subject.move.should == "w"
    end
  end

  describe "when north and west is blocked" do
    subject do
      map = GameMap.new(".#.\n" +
                        "#1.\n" +
                        "...\n")
      AI.new(map)
    end

    it "should travel south" do
      subject.move.should == "s"
    end
  end

  describe "when north and west and south is blocked" do
    subject do
      map = GameMap.new(".#.\n" +
                        "#1.\n" +
                        ".#.\n")
      AI.new(map)
    end

    it "should travel east" do
      subject.move.should == "e"
    end
  end


  describe "when all moves are blocked" do
    subject do
      map = GameMap.new(".#.\n" +
                        "#1#\n" +
                        ".#.\n")
      AI.new(map)
    end

    it "should travel east (suiciding)" do
      subject.move.should == "e"
    end
  end
end
