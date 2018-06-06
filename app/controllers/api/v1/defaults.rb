module API
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        version 'v1', using: :header, vendor: 'crm'

        rescue_from Mongoid::Errors::DocumentNotFound do |e|
          error_response(status: 404, message: e.message)
        end

        rescue_from Mongoid::Errors::Validations do |e|
          error_response(status: 422, message: e.message)
        end

        rescue_from Grape::Exceptions::ValidationErrors do |e|
          error_response(status: 422, message: e.message)
        end

        rescue_from :all do |e|
          opts = { error: e.message, trace: e.backtrace }
          Rack::Response.new(opts.to_json,500,{
          'Content-Type' => "application/json"
          }).finish
        end
      end
    end
  end
end   