Rails.application.routes.draw do
  
  
  devise_for :admins
  devise_for :customers
  
  scope module: :public do
  root to: "homes#top"
  resources :items, only: [:index, :show]
  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw]
  resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  get '/about' => 'homes#about'
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
