ENV['RACK_UP'] = "test"
require File.join(File.dirname(__FILE__), '..', 'app/app.rb')
require 'coveralls'
require 'capybara/rspec'
require 'simplecov'

require './app/data_mapper_setup'
require './app/app'
require 'database_cleaner'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!






Capybara.app = Chitter

RSpec.configure do |config|
  config.before(:suite) do 
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do 
    DatabaseCleaner.start 
  end 

  config.after(:each) do 
    DatabaseCleaner.clean
  end
end

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
 
    mocks.verify_partial_doubles = true
  end
end