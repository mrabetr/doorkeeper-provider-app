# frozen_string_literal: true

module Api::V1
  class CredentialsController < BaseController
    # before_action :doorkeeper_authorize!
    before_action -> { doorkeeper_authorize! :id_token }

    def me
      render json: current_resource_owner
    end

    def application
      render json: current_application
    end
  end
end
