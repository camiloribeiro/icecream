require File.join(File.dirname(__FILE__),"../lib/icecream/icecream")

describe "Icecream" do
  describe "Gets all the objects to factory directory" do
    it "has objects for each file in the factory filder" do
      @fridge = IceCream::IceCream.new File.join(File.dirname(__FILE__),"flavors")

      chocolate = @fridge.flavor :chocolate
      chocolate.class.should be Chocolate
      chocolate.name.should eq "chocolate"
      chocolate.color.should be :brown
      chocolate.price.should be 15.5
      chocolate.calories.should be 150

      cream = @fridge.flavor :cream
      cream.class.should be Cream
      cream.name.should eq "cream"
      cream.color.should be :yellow
      cream.price.should be 17.5
      cream.calories.should be 200

      apple = @fridge.flavor :apple
      apple.class.should be Apple
      apple.name.should eq "apple"
      apple.color.should be :red
      apple.price.should be 1.5
      apple.calories.should be 1500
    end
  end
end
