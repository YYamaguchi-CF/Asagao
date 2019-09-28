class CreatePostIllusts < ActiveRecord::Migration[5.2]
  def change
    create_table :post_illusts do |t|
      t.references :member, null: false # 外部キー
      t.string :title, null: false  # タイトル
      t.text :body  # 本文
      t.datetime :posted_at, null: false  # 投稿日

      t.timestamps
    end
  end
end
