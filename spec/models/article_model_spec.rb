require "rails_helper"

describe Article do
	describe '#create' do
    let(:article) { Article.new }
      context 'article without error' do
        it 'Create article' do
          article.title = "New article title"
          expect(article.valid?).to be true
        end
      end
      context 'article with error' do
        it 'article title null' do
          article.title = nil
          expect(article.valid?).to be false
        end
        it 'article title too short' do
          article.title = "nil"
          expect(article.valid?).to be false
        end
      end
  end
end
