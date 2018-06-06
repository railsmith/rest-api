RSpec.configure do |config|

  config.before(:suite) do
    # Cleans all the databases and prepares the databases for a test suite
    DatabaseCleaner[:mongoid].clean_with(:truncation)
    DatabaseCleaner[:mongoid].strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner[:mongoid].start
  end

  config.after(:each) do
    DatabaseCleaner[:mongoid].clean
  end

end