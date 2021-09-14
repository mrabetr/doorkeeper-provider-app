class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.references :customer, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
