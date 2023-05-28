# 以下で生成。viewファイルも同時に作られる
# bin/rails generate controller Articles index --skip-routes

class ArticlesController < ApplicationController
  # require "application_controller"オートロードされてる
  def index
    # 何も書かないとapp/views/articles/index.html.erbがレンダリングされる

    @articles = Article.all
  end

  def show
    p params  # リクエストパラメータ: {"id"=>"1"}
    @article = Article.find(params[:id]) # コントローラーに送られるパラメータを保持するハッシュようななオブジェクト

  end

#（新規）###########################
  # 新しい記事をインスタンス化
  # app/views/articles/new.html.erbがレンダリングされる
  def new
    @article = Article.new
  end

  # データベースの保存
  def create
    # @article = Ariticle.new(title: params[:article][:title], body: params[:article][:body])　
    # これでも良いが、めんどくさいしミス増えるので、以下のように書く
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article # セーブできたら、redirect_toでshowページに飛ばされる
    else
      render :new, status: :unprocessable_entity # 保存に失敗したら戻るエラーで再表示
      # redirect_toはステートが変更された後で呼び出すもの
    end
  end

#（編集）###########################
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article # 更新されたら、showページに飛ばす
    else
      render :edit, status: :unprocessable_entity
    end
  end

#（削除）###########################
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other # 別のページへ飛ばすsee_other
  end

############################

  private
  def article_params
    params.require(:article).permit(:title, :body) # Strong Parametersは、paramsを強く型付けするの意
  end
end


