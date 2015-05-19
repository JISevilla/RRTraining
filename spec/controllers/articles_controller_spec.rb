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
<<<<<<< HEAD

>>>>>>> spec models
=======
>>>>>>> first tests done
describe ArticlesController do
  let(:user) { create(:user) }

  describe 'POST #create' do
    context 'When creating an article without error' do
      before(:each) do
        sign_in(user)
        user.reload
      end

      it 'Has one more article' do
        expect { post :create, article: { title: '12345', body: 'body' } }.to change{Article.count}.by(1)
      end
    end
  end
<<<<<<< HEAD
end
>>>>>>> articles_controller changed
=======
end
>>>>>>> spec models
