require 'rails_helper'

describe Movie do
  it 'should find movies by the same director' do
    movie_riley1 = Movie.create(:title => "Best Movie", :director => "Riley Campbell")
    movie_riley2 = Movie.create(:title => "The Other Best Movie", :director => "Riley Campbell")
    movie_lst = [movie_riley1, movie_riley2]
    movies = Movie.similar_movies(movie_riley1.title)
    expect(movies).to eq(movie_lst)
  end

  it 'it should not find movies by different directors' do
    movie_riley1 = Movie.create(:title => "Best Movie", :director => "Riley Campbell")
    movie_riley2 = Movie.create(:title => "The Other Best Movie", :director => "Not Riley")
    movie_lst = [movie_riley1, movie_riley2]
    movies = Movie.similar_movies(movie_riley1.title)
    expect(movies).to eq(nil)
  end
end
