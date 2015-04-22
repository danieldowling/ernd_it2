class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :image_url
      t.text :description
      t.boolean :earned

      t.timestamps null: false
    end
  end
end
