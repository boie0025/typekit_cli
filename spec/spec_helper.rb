require 'bundler/setup'
Bundler.setup
Dir[File.dirname(__FILE__) + "/../lib/**/*.rb"].each do |file|
  require file
end

begin
  require 'pry'
rescue
end
