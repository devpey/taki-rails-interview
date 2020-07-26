Rails.application.routes.draw do

  resources :items
  resources :businesses

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


  get    'businesses/index'
  get    'businesses/new'


  post '/api/login' => 'api#login'


  #get    '/signup',       to: 'users#new'

  #get    '/login',        to: 'sessions#new'
  #post   '/login',        to: 'sessions#create'
  #delete '/logout',       to: 'sessions#destroy'

  root 'home#index'

end
