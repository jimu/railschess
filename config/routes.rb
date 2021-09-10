Rails.application.routes.draw do
  get 'home', to: 'player_home#index'
  resources :moves
  root to: 'games#index'
  resources :players
  resources :pieces
  resources :users
  resources :games
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
end
