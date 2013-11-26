require File.join(File.dirname(__FILE__),"../lib/icecream/icecream")
require File.dirname(__FILE__) + "/spec_helper"

describe "Icecream" do
  describe "Gets all the objects to factory directory" do
    it "has objects for each file in the factory filder" do
      @fridge = IceCream::IceCream.new File.join(File.dirname(__FILE__),"flavors")

      chocolate = @fridge.flavor :chocolate
      chocolate.class.should be Chocolate
      chocolate.name.should eq "chocolate"
      chocolate.color.should eq :brown
      chocolate.price.should eq 15.5
      chocolate.calories.should eq 150

      cream = @fridge.flavor :cream
      cream.class.should be Cream
      cream.name.should eq "cream"
      cream.color.should eq :yellow
      cream.price.should eq 17.5
      cream.calories.should eq 200

      apple = @fridge.flavor :apple
      apple.class.should be Apple
      apple.name.should eq "apple"
      apple.color.should eq :red
      apple.price.should eq 1.5
      apple.calories.should eq 1500
    end
  end
end
