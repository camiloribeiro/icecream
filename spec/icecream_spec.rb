require File.join(File.dirname(__FILE__),"../lib/icecream/icecream")

describe "Icecream" do
  describe "Gets all the objects to factory directory" do
    it "has objects for each file in the factory filder" do
      @fridge = IceCream::IceCream.new File.join(File.dirname(__FILE__),"flavors")

      chocolate = @fridge.flavor :chocolate
      chocolate.class.should be Chocolate

      cream = @fridge.flavor :cream
      cream.class.should be Cream

      apple = @fridge.flavor :apple
      apple.class.should be Apple
    end
  end
end
