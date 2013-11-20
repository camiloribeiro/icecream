
module IceCream
  class Parser

    def initialize(path)
      @path = path
      @file = File.read path
    end

    def get_flavor_name
        @title = slice_between_strings(@path, "/flavors/", ".flavor")
    end
    def read
      @file
    end
    def parse
    end
    def slice_between_strings(string, str_start, str_end)
      start_at = string.index(str_start).to_i + str_start.size
      end_at = string.index(str_end)
      string = string.slice start_at..end_at-1
    end
    def objetify
    end
  end
end
