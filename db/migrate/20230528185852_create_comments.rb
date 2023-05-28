# bin/rails generate model Comment commenter:string body:text article:references
# articleの子に関連付けられている。articlesのidカラムを指す外部キー制約となる

class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
