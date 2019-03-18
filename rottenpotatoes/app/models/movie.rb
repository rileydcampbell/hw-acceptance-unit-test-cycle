class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.similar_movies(title)
    director = Movie.find_by(:title=>title).director
    if director.nil? or director.blank? or Movie.where(:director => director).length == 1
      return nil
    end
    return Movie.where(:director => director)
  end
end
