Rails.application.routes.draw do
  namespace :public do
    get "orders/complete" => "orders#complete"
    post "orders/confirm" => "oders#confirm"
    resources :orders, only:[:new,:create,:index,:show]
  end
  root :to =>"public/homes#top"

  scope module: :public do
    resources :items,only:[:index,:show]
    resources :addresses, only: [:create, :index, :destroy, :edit, :update]
    resources :cart_items, only: [:index, :create, :update, :destroy]
     delete 'cart_items' => 'cart_items#destroy_all', as: 'destroy_all'
  end

  namespace :admin do
    root "homes#top"
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:show, :index, :edit, :update]
    resources :orders, only: [:index]
  end

  get "customers" => "public/customers#show", as: "customer"
  get "customers/:id/edit" => "public/customers#edit", as: "edit_customer"
  patch "customers/:id" => "public/customers#update", as: "update_customer"
  get "customers/:id/unsubscribe" => "public/customers#unsubscribe", as: "unsubscribe"
  patch "customers/:id/withdraw" => "customers#withdraw", as: "withdraw"

  get "homes/about"=>"public/homes#about"

  namespace :admin do
    resources :items,only:[:index,:new,:create,:show,:edit,:update]
  end

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end