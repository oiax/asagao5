class Admin::ArticlesController < Admin::Base
  # 記事一覧
  def index
    @articles = Article.order(released_at: :desc)
      .page(params[:page]).per(5)
  end

  # 記事詳細
  def show
    @article = Article.find(params[:id])
  end

  # 新規登録フォーム
  def new
    @article = Article.new
  end

  # 編集フォーム
  def edit
    @article = Article.find(params[:id])
  end

  # 新規作成
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to [:admin, @article], notice: "ニュース記事を登録しました。"
    else
      render "new"
    end
  end

  # 更新
  def update
    @article = Article.find(params[:id])
    @article.assign_attributes(article_params)
    if @article.save
      redirect_to [:admin, @article], notice: "ニュース記事を更新しました。"
    else
      render "edit"
    end
  end

  # 削除
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to :admin_articles
  end

  # ストロング・パラメータ
  private def article_params
    params.require(:article).permit(
      :title,
      :body,
      :released_at,
      :no_expiration,
      :expired_at,
      :member_only
    )
  end
end
