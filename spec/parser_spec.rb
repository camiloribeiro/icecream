require File.join(File.dirname(__FILE__),"../lib/icecream/parser")

describe "Parser" do
  describe "Parsing a file into an array" do
    before(:all) do
      @parser = IceCream::Parser.new File.join(File.dirname(__FILE__),"../spec/flavors/chocolate.flavor")
    end
    it "Reading the file" do
      @parser.read.should == "@name = \"chocolate\"\n@calories = 150\n@color = :brown\n@price = 15.5\n"
    end
    it "Gets the string between two strings" do
      @parser.slice_between_strings("/super/flavors/chocolate.flavor", "/flavors/", ".flavor")
      .should == "chocolate"
    end
    it "Gets the name of the future object" do
      @parser.get_flavor_name
    end
  end
end
