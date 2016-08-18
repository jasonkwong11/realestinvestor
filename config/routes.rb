Rails.application.routes.draw do
 
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#home"
  resources :users, :posts

  post '/users/new' => "/users/sign_up"

end
