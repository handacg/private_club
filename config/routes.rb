Rails.application.routes.draw do
  #root 'controller#method'
  resources :users
  get '/signup', to: 'users#new'
  get '/login', to:'session#new'
  post '/login', to:'session#create'
  post '/logout', to:'session#destroy'
end
