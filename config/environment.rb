# Load the Rails application.
require File.expand_path('../application', __FILE__)
NoAzul::Application.configure do 
  config.assets.paths << "#{ Rails.root }/app/assets/templates"
end

# Initialize the Rails application.
NoAzul::Application.initialize!
