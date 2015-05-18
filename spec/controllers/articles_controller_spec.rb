require "rails_helper"

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
end