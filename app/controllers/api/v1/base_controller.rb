# frozen_string_literal: true

module Api::V1
  # class ApiController < ::ApplicationController
  class BaseController < ActionController::API
    def current_resource_owner
      # User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      # Customer.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      doorkeeper_token.resource_owner #after enabling Polymorphic Resource Owner
    end

    def current_application
      # Doorkeeper::Application.find(doorkeeper_token.application_id) if doorkeeper_token
      OauthApplication.find(doorkeeper_token.application_id) if doorkeeper_token
    end
  end
end
