Rails.application.routes.draw do
  resources :restaurants
  resources :votes
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "votes#index"
  
end
