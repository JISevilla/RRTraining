class CommentsController < ApplicationController
  before_action :article_get, only: [:create, :destroy]
  http_basic_authenticate_with name: 'dhh', password: 'secret', only: :destroy

  def create
    @comment = @article.comments.create(comment_params)

    redirect_to article_path(@article)
  end

  def destroy
    @comment = @article.comments.find(params[:id])

    @comment.destroy

    redirect_to article_path(@article)
  end

  def article_get
    @article = Article.find(params[:article_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
