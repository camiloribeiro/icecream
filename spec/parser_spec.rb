require File.join(File.dirname(__FILE__),"../lib/icecream/parser")

describe "Parser" do
  describe "Parsing a file into an array" do
    before(:all) do
      @path = File.join(File.dirname(__FILE__),"../spec/flavors/chocolate.flavor")
    end
    it "Gets the object" do
      obj = IceCream::Parser.get_flavor @path
      obj.class.should be Chocolate
    end
    it "Gets the string between two strings" do
      IceCream::Parser.slice_between_strings("/super/flavors/chocolate.flavor", "/flavors/", ".flavor")
      .should == "chocolate"
    end
    it "Gets the name of the future object" do
      IceCream::Parser.get_flavor_name(@path).should == "chocolate"
    end
    it "Returns the right type of the value" do
      
      # Strings
      IceCream::Parser.fix_value("\"chocolate\"").should == "chocolate"
      IceCream::Parser.fix_value("\"15\"").should == "15"
      
      # Symbles
      IceCream::Parser.fix_value(":i15").should == :i15

      # Float
      IceCream::Parser.fix_value("15.5").should == 15.5
      
      # Int
      IceCream::Parser.fix_value("15").should == 15

      # Invalid conversions
      IceCream::Parser.fix_value("15s").should == ""
      
    end
  end
end
