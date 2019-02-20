class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :display_name, limit: 24, null: false
      t.string :email_address, limit: 255, null: false
      t.string :tags, :array => true
      t.boolean :enabled, null: false

      t.timestamps
    end
    add_index :users, :email_address, unique: true
  end
end
