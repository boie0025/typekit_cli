module TypekitCLI
  class Family
    ATTRIBUTES = %i(id name slug css_names css_stack subset variations).freeze
    attr_reader :family_attributes

    # @param [Hash] family_attributes a hash containing family attributes.
    def initialize(family_attributes)
      @family_attributes = family_attributes
    end

    # Convenience methods - delegation to family_attributes.
    ATTRIBUTES.each do |meth|
      define_method(meth) { family_attributes[meth.to_s] }
    end

  end
end
