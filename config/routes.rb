Rails.application.routes.draw do
  root to: 'games#index'
  resources :players
  resources :pieces
  resources :users
  resources :games
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
