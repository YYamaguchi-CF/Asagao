class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.references :post_illusts
      t.string :alt_text, null: false, default: ""
      t.integer :position

      t.timestamps
    end
  end
end
