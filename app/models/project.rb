# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :user
  # has_many :oauth_applications
  # has_many ::Doorkeeper.applications
  has_many :customers
  has_many :notes

  validates :user, :name, :url, presence: true
end
