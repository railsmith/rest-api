class API::Base < Grape::API

  # Override default Grape parsers and other engines with Json parsers
  content_type :json, 'application/json'
  
  # Make json as the default request and response format
  default_format :json
  
  # Uncomment this if you do not want to allow any other format other than json
  format :json
  
  # Use grape_jbuilder to render json views
  formatter :json, Grape::Formatter::Jbuilder
    
  default_error_formatter :json
  
  # Use WineBouncer to integrate doorkeeper with Grape
  # use ::WineBouncer::OAuth2
  
  # Mount version routes here
  mount API::V1::Base
  
  # Rescue all path not found errors
  route :any, '*path' do
    error!({message: "No such route '#{request.path}'", status: 404}, 404)
  end
end