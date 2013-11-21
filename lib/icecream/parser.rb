
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
      all_particularities = @file.split("\n").map
      objectify get_flavor_name, all_particularities
    end

    def parse_variables particularity
      particularity.split("=").first.strip.to_s
    end

    def parse_values particularity
      particularity.split("=").last.strip
    end
    def slice_between_strings(string, str_start, str_end)
      start_at = string.index(str_start).to_i + str_start.size
      end_at = string.index(str_end)
      string = string.slice start_at..end_at-1
    end
    
    def fix_value value
      #require "pry"; binding.pry
      if value[0] == ":"
        final = value.gsub(":","").to_sym 
      elsif !value.slice("\"").nil?
        final = value.gsub("\"","") 
      end
      final
      
    end

    private

    def objectify flavor, all_particularities
      class_name = flavor.capitalize
      klass = Object.const_set(class_name,Class.new)
      variables = all_particularities.each { | particularity | parse_variables particularity }
      values = all_particularities.each { | particularity | parse_values particularity }
    
      klass.class_eval do
        attr_accessor *variables

        define_method(:initialize) do
          variables.each_with_index do |variable_name,i|
            instance_variable_set("@"+variable_name, values[i])
          end
        end
      end
      obj = klass.new
    end


  end
end
