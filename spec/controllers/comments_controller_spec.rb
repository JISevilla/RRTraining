require 'rails_helper'
describe CommentsController do
  let(:article) { create(:article) }
  describe 'POST #create' do
    context 'When creating a comment correctly' do
      before(:each) do
        post :create, article_id: article.id, comment: { body: Faker::Lorem.characters }
      end
      it 'comment belong to article' do
        Comment.last.article_id.should equal(article.id)
      end
      it 'Has one more comment' do
        expect { post :create, article_id: article.id, comment: { body: Faker::Lorem.words } }
          .to change { Comment.count } .by(1)
      end
    end
  end
end
