# inside spec_help.rb
RSpec.configure do |config|
  # Do not run :slow tests by default
  config.filter_run_excluding :slow
end
