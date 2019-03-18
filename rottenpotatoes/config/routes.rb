Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  get 'find_similar_movies/:title' => 'movies#find_similar', :as => 'find_similar'
end
