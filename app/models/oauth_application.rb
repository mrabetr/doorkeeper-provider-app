# frozen_string_literal: true

class OauthApplication < ApplicationRecord
  include ::Doorkeeper::Orm::ActiveRecord::Mixins::Application

  belongs_to :project
end
