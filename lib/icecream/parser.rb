
module IceCream
  class Parser
    def read
      @file = File.read(File.join(File.dirname(__FILE__),"../../spec/flavors/chocolate.rb")) 
    end
    def parse
    end
    def objetify
    end
  end
end
