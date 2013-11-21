require File.join(File.dirname(__FILE__),"../lib/icecream/parser")

describe "Parser" do
  describe "Parsing a file into an array" do
    before(:all) do
      @parser = IceCream::Parser.new File.join(File.dirname(__FILE__),"../spec/flavors/chocolate.flavor")
    end
    it "Reading the file" do
      obj = @parser.read
      obj.class.should be Chocolate
#      obj.name.should be "chocolate"
    end
    it "Gets the string between two strings" do
      @parser.slice_between_strings("/super/flavors/chocolate.flavor", "/flavors/", ".flavor")
      .should == "chocolate"
    end
    it "Gets the name of the future object" do
      @parser.get_flavor_name.should == "chocolate"
    end
    it "Returns the right type of the value" do
      
      # Strings
      @parser.fix_value("\"chocolate\"").should == "chocolate"
      @parser.fix_value("\"15\"").should == "15"
      
      # Symbles
      @parser.fix_value(":i15").should == :i15

      # Float
      @parser.fix_value("15.5").should == 15.5
      
      # Int
      @parser.fix_value("15").should == 15

      # Invalid conversions
      @parser.fix_value("15s").should == ""
      
    end
  end
end
