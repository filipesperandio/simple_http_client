require 'rubygems'
require 'spork'

Spork.prefork do
  require 'rspec'

  RSpec.configure do |config|
    config.run_all_when_everything_filtered = true
    config.filter_run :focus
    config.order = 'random'
  end
end

Spork.each_run do
  # automatically include all the /lib files
  lib_folder = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
  Dir["#{lib_folder}/**/*.rb"].each do |file|
    require file
  end
end
