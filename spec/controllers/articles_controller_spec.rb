describe 'GET #article' do
  context 'when params[:id] == id' do
	  it 'return the correct article' do
	    @article.id.should eql id
	  end
	end
end