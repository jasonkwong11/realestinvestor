Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#home"
  resources :users, :posts


  get "/signin" => "users#signin"
  get "/signout" => "users#signout"
  post "/signin" => "users#begin_new_session"


end
