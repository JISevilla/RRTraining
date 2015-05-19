
class BlogMailer < ApplicationMailer

  def send_articles(articles, user)
    @articles = articles
    @user = user
    ActionMailer::Base.mail(template_path: 'articles', template_name: 'send_articles',from: 'notifications@example.com', to: 'julian.sevilla@wolox.com.ar', subject: 'Last 10 articles of Blog!').deliver_now!
  end
end