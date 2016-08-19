Rails.application.routes.draw do
 get '/auth/facebook/callback' => 'sessions#create'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#home"
  resources :users
  resources :posts do
    resources :comments
  end

  post '/users/new' => "/users/sign_up"
  post '/posts/:id/comments/new', to: "comments#create" 

end
