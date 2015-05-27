class ArticlePolicy < ApplicationPolicy
  attr_reader :user, :article

  def initialize(user, article)
  	@user = user
    @article = article
  end

  def update?
    article.user_id == user.id
  end

  def destroy?
    article.user_id == user.id
  end
end