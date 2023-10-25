class CreatePostImageTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :post_image_tag_relations do |t|
      
      t.integer :post_image_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
  end
end
