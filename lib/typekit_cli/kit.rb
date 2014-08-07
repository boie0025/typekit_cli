require 'json'
module TypekitCLI
  class Kit
    attr_reader :attributes

    # @params [Hash] attributes hash attributes for this kit
    def initialize(attributes)
      @attributes = attributes
    end


    # Convenience methods - delegation to kit_attributes.
    %i(name id analytics domains families).each do |meth|
      define_method(meth) { kit_attributes[meth.to_s] }
    end

    def kit_attributes
      attributes["kit"]
    end

    # @return Hash of kits included for the current env TYPEKIT_TOKEN
    class << self
      # Provides a simple listing
      # @return [Hash]
      def all
        api_call_and_execute :kits
      end

      def find(id)
        new(api_call_and_execute :kits, id: id)
      end

      private

      def api_call_and_execute(*args)
        Services::TypekitAPI.new(*args).execute!.to_h
      end
    end

  end
end
