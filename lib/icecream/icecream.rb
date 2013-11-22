require File.join(File.dirname(__FILE__),"./parser")

module IceCream
  class IceCream

    def initialize(path)
      Dir.glob("#{path}/*.flavor") do |flavor_file_path|
        flavor = Parser.get_flavor flavor_file_path
        instance_name = flavor.class.to_s.downcase
        instance_variable_set("@"+instance_name, flavor)
        define_singleton_method(instance_name) do
          "@"+instance_name
        end
        define_singleton_method(instance_name+"=") do |new_value|
          "@"+instance_name = new_value
        end
      end

      def flavor flavor
        instance_variable_get ("@" + flavor.to_s).to_sym
      end

    end
  end
end
