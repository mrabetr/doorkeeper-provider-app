class AddProjectToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_reference :customers, :project, null: false, foreign_key: true, index: true
  end
end
