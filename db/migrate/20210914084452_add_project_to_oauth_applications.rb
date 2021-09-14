class AddProjectToOauthApplications < ActiveRecord::Migration[6.1]
  def change
    add_reference :oauth_applications, :project, null: false, foreign_key: true, index: true
  end
end
