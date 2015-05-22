<<<<<<< HEAD
<<<<<<< HEAD
class LastArticlesPerUser
  include Sidekiq::Worker
  def perform()
    BlogMailer.send_last_articles_per_user().deliver_now!
=======
class LastArticlesPerUser
  include Sidekiq::Worker
  def perform()
<<<<<<< HEAD
    @users = User.last(5)
    @articles = Article.last(10)
    users.each { |user| puts BlogMailer.send_articles(@articles, user).deliver_now! }
>>>>>>> almost there
=======
    BlogMailer.send_last_articles_per_user().deliver_now!
>>>>>>> artperuser - ajax
  end
end