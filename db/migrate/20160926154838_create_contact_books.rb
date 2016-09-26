class CreateContactBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_books do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
