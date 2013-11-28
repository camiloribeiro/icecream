require File.join(File.dirname(__FILE__),"./parser")

module IceCream
  class IceCream

    def self.flavor flavor_name, flavor_details
      object = Parser.objectify flavor_name.to_s, flavor_details
                                                                .gsub("[","")
                                                                .gsub("]","")
                                                                .split(",")
                                                                .map
    end

    private
    def self.create_instance instance_name, flavor, instance=nil
      instance = self if instance.nil?
      instance.instance_variable_set("@"+instance_name, flavor)
      instance.define_singleton_method(instance_name) do
        "@"+instance_name
      end
      instance.define_singleton_method(instance_name+"=") do |new_value|
        "@"+instance_name = new_value
      end
    end

    def initialize(path)
      Dir.glob("#{path}/*.flavor") do |flavor_file_path|
        flavor = Parser.get_flavor flavor_file_path
        instance_name = flavor.class.to_s.downcase
        self.class.create_instance instance_name, flavor, self
      end

      def flavor flavor
        instance_variable_get ("@" + flavor.to_s).to_sym
      end

    end
  end
end
