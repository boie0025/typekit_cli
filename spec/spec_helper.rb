require 'bundler/setup'
Bundler.setup

require 'simplecov'
SimpleCov.start

Dir[File.dirname(__FILE__) + "/../lib/**/*.rb"].each do |file|
  require file
end

require 'coveralls'
Coveralls.wear!

begin
  require 'pry'
rescue
end
