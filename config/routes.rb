Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/regstrations",
    sessions: 'public/sessions'
  }
  devise_for :admins,skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  
  namespace :admin do
    get '/admin' => 'admin/homes#top'
    resources :items, only: [:new, :index, :create, :show, :edit, :update]
    resources :genres, only: [:indax, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

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
