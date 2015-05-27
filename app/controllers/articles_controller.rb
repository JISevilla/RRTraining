class ArticlesController < ApplicationController
  before_action :article, only: [:edit, :show]
  before_action :authenticate_user!
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
    @article.update_attributes(user_id: current_user.id)
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
    BlogMailer.send_articles.deliver_now!
  end

  def send_last_articles_per_user
    BlogMailer.send_last_articles_per_user.deliver_now!
    LastArticlesPerUser.perform_async
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :user_id)
  end

  def article
    @article ||= Article.find(params[:id])
  end

  def user_not_authorized(exception)
    @exception = exception
    redirect_to articles_path error: t(exception.query)
  end
end
