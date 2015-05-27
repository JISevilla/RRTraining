class ArticlesController < ApplicationController
  before_action :article, only: [:edit, :show]
  before_action :authenticate_user!
  http_basic_authenticate_with name: 'dhh', password: 'secret', except: [:index, :show]
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  attr_accessor :title, :id
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
    authorize @article
  end

  def update
    if article.update(article_params)

      redirect_to @article

    else
      authorize @article
      render 'edit'
    end
  end

  def destroy
    authorize article
    article.destroy

    redirect_to articles_path
  end
  
  def send_articles
    @articles = Article.last(10)
    @user = current_user.email
    BlogMailer.send_articles(@articles, @user).deliver_now!
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def article
    @article ||= Article.find(params[:id])
  end

  def user_not_authorized (exception)
    @exception = exception
    redirect_to articles_path error: t(exception.query)
  end

end
