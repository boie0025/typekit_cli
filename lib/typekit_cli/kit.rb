require 'json'
module TypekitCLI
  class Kit
    ATTRIBUTES = %i(name id analytics domains).freeze
    attr_reader :attributes, :errors

    # @params [Hash] attributes hash attributes for this kit
    def initialize(attributes)
      if attributes.include?("errors")
        @errors = attributes["errors"]
      else
        @attributes = attributes
      end
    end

    # Convenience methods - delegation to kit_attributes.
    ATTRIBUTES.each do |meth|
      define_method(meth) { kit_attributes[meth.to_s] }
    end

    def kit_attributes
      attributes["kit"]
    end

    def has_errors?
      !!errors
    end

    def families
      kit_attributes["families"].map do |family|
        Family.new(family)
      end
    end

    # @return Hash of kits included for the current env TYPEKIT_TOKEN
    class << self


      # Provides a simple listing
      # @return [Hash] Returns a hash if kits are found.  Error message otherwise.
      def all
        result = api_call_and_execute :kits
        if result.include?("errors")
          return "Error(s): #{ result['errors'].join(', ') }"
        end
        result
      end

      # @param [String | Integer] the ID if the kit to look up
      # @return [Kit] the typekit as returned from the API
      def find(id)
        if (result = api_call_and_execute(:kits, id: id))
          return new(result)
        end
      end

      private

      def api_call_and_execute(*args)
        Services::TypekitAPI.new(*args).execute!.to_h
      end
    end

  end
end
