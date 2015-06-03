class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :comments, dependent: :destroy
  has_many :articles, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2, :facebook]

  def self.find_for_oauth(access_token)
    data = access_token.info
    User.where(email: data['email']).first_or_create! do |user|
      user.email = data['email']
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
