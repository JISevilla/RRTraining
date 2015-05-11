class ArticlesController < ApplicationController
  before_action :article_get, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user!
  http_basic_authenticate_with name: 'dhh', password: 'secret', except: [:index, :show]
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save

      redirect_to @article
    else

      render 'new'

    end
  end

  def edit
  end

  def update
    if @article.update(article_params)

      redirect_to @article

    else

      render 'edit'
    end
  end

  def destroy
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def article_get
    @article = Article.find(params[:id])
  end
end