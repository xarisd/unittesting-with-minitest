# inside spec_help.rb

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
end
