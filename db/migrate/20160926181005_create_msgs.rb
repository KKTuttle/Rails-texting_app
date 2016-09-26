class CreateMsgs < ActiveRecord::Migration[5.0]
  def change
    create_table :msgs do |t|
      t.string :body
      t.integer :contact_id

      t.timestamps
    end
  end
end
