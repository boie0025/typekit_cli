module TypekitCLI
  class BaseModel

    # Convenience methods - delegation to kit_attributes.
    # to use, define ATTRIBUTES on your model to be an array of symbols for methods
    #  to create that are also keys the the ATTRIBUTES_METHOD_NAME hash that is also
    #  defined in your model.
    def inherited(child_class)
      ATTRIBUTES.each do |meth|
        binding.pry
        child_class.define_method(meth) { send child_class::ATTRIBUTES_METHOD_NAME, :[], meth.to_s }
      end
    end
  end
end
