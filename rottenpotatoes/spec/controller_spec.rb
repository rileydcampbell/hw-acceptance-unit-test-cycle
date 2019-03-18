require 'rails_helper'
  describe MoviesController , :type => :controller do
    describe 'when specified movie has/does not have a director' do
     it 'should assign similar movies if director exists' do
      movies = ['SuperDuper', 'Shoota', 'BestMovie']
      allow(Movie).to receive(:similar_movies).with('SuperDuper').and_return(movies)
      get :find_similar, {:title => "SuperDuper"}
      expect(assigns(:movies)).to eql(movies)
      expect(response).to render_template('find_similar')
    end
     it "should redirect to home page if director isn't known" do
      allow(Movie).to receive(:similar_movies).with('Nada').and_return(nil)
      get :find_similar, {:title => "Nada"}
      expect(assigns(:movies)).to eql(nil)
      expect(response).to redirect_to('/movies')
    end
  end
  describe 'when adding/deleting a movie record' do
    it "create a movie record" do
      expect {post :create, :movie => {:title=>"Fake Movie"}}.to change {Movie.count}.by(1)
   end
    end
  end
