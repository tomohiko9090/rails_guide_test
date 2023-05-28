# bin/rails generate model Article title:string body:text

class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body

      t.timestamps #created_at, updated_atカラムを定義
    end
  end
end
