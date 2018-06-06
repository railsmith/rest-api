require 'rails_helper'
require 'rspec_api_documentation'
require 'rspec_api_documentation/dsl'
require 'rspec/json_expectations'


RspecApiDocumentation.configure do |config|
  
  config.app = Rails.application
  
  config.docs_dir = Rails.root.join("doc", "api")
  
  config.format = [:json, :combined_text, :html]
  
  config.curl_host = 'http://localhost:3000/'
  
  config.api_name = "CRM API"
end