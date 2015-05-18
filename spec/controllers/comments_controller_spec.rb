require 'rails_helper'

describe CommentsController do
	let(:user) {create (:user)}
	let(:article) {create (:article)}

	describe 'POST #create' do

    context 'When creating a comment correctly' do
      before(:each) do
        sign_in(user)
        user.reload
        post :create, article_id: article.id, comment: { body: 'qwe' }
      end

      it 'comment belong to article' do
        Comment.last.article_id.should equal(article_id)
      end

      it 'comment belong to user' do
        Comment.last.user_id.should equal(user.id)
      end
    end
  end
end