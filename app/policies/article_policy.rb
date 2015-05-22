<<<<<<< HEAD
class ArticlesPolicy
  attr_reader :user, :article

  def initialize(article)
=======
class ArticlePolicy < ApplicationPolicy
  attr_reader :user, :article

  def initialize(user, article)
  	@user = user
>>>>>>> pundit done
    @article = article
  end

  def update?
<<<<<<< HEAD
    user.admin? or article.user_id==current_user.id
=======
    article.user_id == user.id
  end

  def destroy?
    article.user_id == user.id
>>>>>>> pundit done
  end
end