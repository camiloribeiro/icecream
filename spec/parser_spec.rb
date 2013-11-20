require File.join(File.dirname(__FILE__),"../lib/icecream/parser")

describe "Parser" do
  describe "Parsing a file into an array" do
    before(:all) do
      @parser = IceCream::Parser.new
    end
    it "Reading the file" do
      @parser.read.should == "@name = \"chocolate\"\n@calories = 150\n@color = :brown\n@price = 15.5\n"
    end
  end
end
