module TypekitCLI
  class FamilyShow
    attr_reader :family


    # @params [Family] family the family to display
    def initialize(family)
      @family = family
    end

    # @note this method outputs with puts directly.
    # @return nil.
    def display
      puts ''
      Family::ATTRIBUTES.each do |attribute|
        puts "Family #{ attribute.to_s.capitalize}: #{family.send(attribute) }"
      end
    end

  end
end
