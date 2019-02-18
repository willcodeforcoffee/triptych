class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :display_name
      t.string :email_address
      t.string :tags, :array => true
      t.boolean :enabled

      t.timestamps
    end
    add_index :users, :email_address, unique: true
  end
end
