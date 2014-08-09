require 'bundler/setup'
Bundler.setup

require 'coveralls'
Coveralls.wear!

require 'simplecov'
SimpleCov.start

Dir[File.dirname(__FILE__) + "/../lib/**/*.rb"].each do |file|
  require file
end

begin
  require 'pry'
rescue
end
