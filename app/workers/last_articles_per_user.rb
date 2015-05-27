class LastArticlesPerUser
  include Sidekiq::Worker
  def perform()
    BlogMailer.send_last_articles_per_user().deliver_now!
  end
end