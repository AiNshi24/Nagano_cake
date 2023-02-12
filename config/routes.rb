Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/regstrations",
    sessions: 'public/sessions'
  }
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get '/' => 'homes#top'
    resources :items, only: [:new, :index, :create, :show, :edit, :update]
    resources :genres, only: [:indax, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    resources :sessions, only: [:new, :create, :destroy]
  end

  scope module: :public do
  root to: "homes#top"
  resources :items, only: [:index, :show]
  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  get '/about' => 'homes#about'
  get 'customers/mypage' => 'customers#show'
  get 'customers/information/edit' => 'customers#edit'
  patch 'customers/information' => 'customers#update'
  get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
  patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
