Rails.application.routes.draw do
 get '/auth/facebook/callback' => 'sessions#create'

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up => 'signup'}, :controllers => { registrations: 'registrations', :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#home"
  resources :users
  resources :posts do
    resources :comments
  end

  post '/users/new' => "/users/sign_up"

end
