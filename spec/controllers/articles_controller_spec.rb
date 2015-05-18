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
