module TypekitCLI
  class Kit

    def self.kits
      JSON.parse Services::TypekitAPI.new(:kits)
    end

  end
end
