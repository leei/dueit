RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
end

# Setup for Devise/OmniAuth integration
OmniAuth.config.test_mode = true
