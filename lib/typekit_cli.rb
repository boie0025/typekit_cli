Gem.find_files("typekit_cli/**/*.rb").each { |path| require path }

module TypekitCLI
  class Services::ConfigurationError < StandardError; end
end
