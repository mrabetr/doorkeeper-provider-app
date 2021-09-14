class Note < ApplicationRecord
  belongs_to :customer
  # belongs_to :project

  validates :project, :customer, :description, presence: true
end
