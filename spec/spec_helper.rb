require 'rspec'
require 'coveralls'

Coveralls.wear!

RSpec.configure do |config|
  config.color = true
  config.formatter     = 'documentation'
end
