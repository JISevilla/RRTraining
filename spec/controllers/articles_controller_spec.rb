<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
require 'rails_helper'
describe ArticlesController do
  let(:user) { create(:user) }
  describe 'POST #create' do
    context 'When creating an article without error' do
      before(:each) do
        sign_in(user)
        user.reload
      end
      it 'Has one more article' do
        expect { post :create,
                      article: { title: Faker::Lorem.characters(5), body: Faker::Lorem.characters }
        } .to change { Article.count } .by(1)
      end
    end
  end
end
=======
describe 'GET #article' do
  context 'when params[:id] == id' do
	  it 'return the correct article' do
	    @article.id.should eql id
	  end
	end
end
>>>>>>> spec files
=======
require "rails_helper" 
=======
require "rails_helper"

>>>>>>> spec models
describe ArticlesController do
  let(:user) { create(:user) }

  describe 'POST #create' do
    context 'when user logged in' do
      before do
        sign_in user
        get :create
      end
      context 'article without error' do
      end
      context 'article with error' do
      end
    end
    context 'when user not logged in' do
      before do
        get :create
      end

      it { is_expected.to redirect_to new_session_path }
      it { is_expected.to set_the_flash(:warning).to('Please log in.') }
      it { is_expected.to set_session(:return_to).to(posts_path) }
    end
  end
<<<<<<< HEAD
end
>>>>>>> articles_controller changed
=======
end
>>>>>>> spec models
