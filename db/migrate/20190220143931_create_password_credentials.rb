class CreatePasswordCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :password_credentials do |t|
      t.references :user, foreign_key: true
      t.string :scheme, limit: 24, null: false
      t.string :data1
      t.string :data2
      t.datetime :valid_until
      t.boolean :enabled, null: false

      t.timestamps
    end

    add_index :password_credentials, :scheme
  end
end
