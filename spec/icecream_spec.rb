require File.join(File.dirname(__FILE__),"../lib/icecream/icecream")
require File.dirname(__FILE__) + "/spec_helper"

describe "Icecream" do
  describe "Gets all the objects to factory directory" do
    before(:each) do
      @fridge = IceCream::IceCream.new File.join(File.dirname(__FILE__),"flavors")
    end
    it "has objects for each file in the factory filder" do

      chocolate = @fridge.flavor :chocolate
      chocolate.class.should be Chocolate
      chocolate.name.should eq "chocolate"
      chocolate.color.should eq :brown
      chocolate.price.should eq 15.5
      chocolate.calories.should eq 150
      chocolate.resumo.should eq ["chocolate", 150, :brown, 15.5]

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
    it "creates a new flavor from an array" do
      new_flavor = IceCream::IceCream.flavor :Orange, "[name = 'orange', color = :orange, price = 35.5, calories = 3]"
      new_flavor.class.should be Orange
      new_flavor.name.should eq "orange"
      new_flavor.color.should eq :orange
      new_flavor.price.should eq 35.5
      new_flavor.calories.should eq 3
    end
    it "merges the objects" do
      cream = @fridge.flavor :cream
      complementary_flavor = IceCream::IceCream.flavor :Orange, "[name = 'orange', price = 35.5]"
      
      IceCream::IceCream.merge cream, complementary_flavor

      cream.class.should be Cream
      cream.name.should eq "orange"
      cream.color.should eq :yellow
      cream.price.should eq 35.5
      cream.calories.should eq 200
    end
  end
end
