
module IceCream
  class Parser

    def self.get_flavor path
      all_particularities = File.read(path).split("\n").map
      objectify get_flavor_name(path), all_particularities
    end

    private

    def self.get_flavor_name path
        title = slice_between_strings(path, "/flavors/", ".flavor")
    end

    def self.parse_variables particularity
      particularity.split("=").first.strip.to_s
    end

    def self.parse_values particularity
      particularity.split("=").last.strip
    end
    def self.slice_between_strings(string, str_start, str_end)
      start_at = string.index(str_start).to_i + str_start.size
      end_at = string.index(str_end)
      string = string.slice start_at..end_at-1
    end
    
    def self.fix_value value
      if (value[0] == "[") && (value[-1, 1] == "]")
        final = value.gsub("[","") .gsub("]","").split(",")
      elsif value[0] == ":"
        final = value.gsub(":","").to_sym 
      elsif !value.slice("\"").nil?
        final = value.gsub("\"","") 
      elsif (value[0] == "'") && (value[-1, 1] == "'")
        final = value.gsub("'","") 
      elsif !value.slice(".").nil?
        final = value.to_f if Float(value) rescue false
      elsif !((Integer(value) rescue nil) == nil)
        final = value.to_i
      else
        final = ""
      end
      final
      
    end
    def self.objectify flavor, all_particularities
      class_name = flavor.capitalize

      original_verbosity = $VERBOSE
      $VERBOSE = nil

      klass = klass || Object.const_set(class_name,Class.new)

      $VERBOSE = original_verbosity

      variables = all_particularities.each { | particularity | parse_variables particularity }
      values = all_particularities.each { | particularity | parse_values particularity }
      

      
      klass.class_eval do
        attr_accessor *variables

        define_method(:initialize) do
          variables.each_with_index do |variable_name,i|
            instance_variable_set("@"+variable_name, Parser.fix_value(values[i]))
          end
        end
      end
      obj = klass.new
    end
  end
end
