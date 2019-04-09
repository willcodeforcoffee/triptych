class CreateContentBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :content_blocks do |t|
      t.string :key
      t.string :link
      t.string :title
      t.text :summary
      t.text :content
      t.string :author
      t.datetime :published_at
      t.integer :version

      t.timestamps
    end
  end
end
