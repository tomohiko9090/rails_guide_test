# bin/rails generate controller Comments
class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    # @articleに関連付けられたコメントの集合を取得している
    @comment = @article.comments.create(comment_params) # newとsaveを一緒に行うcreate。buildにするとnewのみ行われる。
    redirect_to article_path(@article) #showに戻る
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
