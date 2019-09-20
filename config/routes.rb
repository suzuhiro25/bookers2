Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :books
  resources :users
  get "/home/about" => "home#about", as: "home_about"
end
