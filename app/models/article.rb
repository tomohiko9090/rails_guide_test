# bin/rails generate model Article title:string body:text

class Article < ApplicationRecord
  has_many :comments # これはcommentsが書かれた後に追加する

  validates :title, presence: true # ホワイトスペース（スペース文字、改行、Tabなど）以外の文字が1個以上含まれていなければならない
  validates :body, presence: true, length: { minimum: 10 } # 10文字以上でなければならない
end
