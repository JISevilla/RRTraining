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
        expect { create(:article) }.to change { Article.count } .by(1)
      end
    end
  end
end
