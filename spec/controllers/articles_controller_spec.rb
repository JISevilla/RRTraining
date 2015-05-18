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
describe ArticlesController do
  describe 'GET #index' do
    context 'when user is logged in' do
      with :user
      before do
        sign_in user
        get :index
      end
      it { is_expected.to redirect_to new_session_path }
      it { is_expected.to set_the_flash(:warning).to('Please log in.') }
    end
    context 'when user is logged out' do
      before do
        get :index
      end
      it { is_expected.to redirect_to new_session_path }
      it { is_expected.to set_the_flash(:warning).to('Please log in.') }
      it { is_expected.to set_session(:return_to).to(posts_path) }
    end
  end
end
>>>>>>> articles_controller changed
