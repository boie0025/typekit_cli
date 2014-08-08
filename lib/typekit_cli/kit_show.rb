module TypekitCLI
  class KitShow

    attr_accessor :kit

    # @params [Kit] kit a kit to display information about
    def initialize(kit)
      self.kit = kit
    end

    # @note this method outputs with puts directly.
    # @return nil.
    def display
      if kit.has_errors?
        puts "Error(s): #{kit.errors.join(', ')}"
      else
        %i(name id analytics).each do |attribute|
          puts "Kit #{ attribute.to_s.capitalize}: #{kit.send(attribute) }"
        end
        puts "Kit Domains: #{ kit.domains.join(', ')}"
      end
    end

    private


  end

end
