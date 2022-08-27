Rails.application.routes.draw do

  root :to =>"public/homes#top"

  scope module: :public do
    resources :items,only:[:index,:show]
     get 'items/search/:id' => 'items#search',as: 'item_search'
    resources :addresses, only: [:create, :index, :destroy, :edit, :update]
    resources :cart_items, only: [:index, :create, :update, :destroy]
     delete 'cart_items' => 'cart_items#destroy_all', as: 'destroy_all'
    get "orders/complete" => "orders#complete"
    post "orders/confirm" => "orders#confirm"
    resources :orders, only:[:new,:create,:index,:show]
    #resources :customer, only:[:show, :edit, :update]
    # get "customers/unsubscribe" => "public/customers#unsubscribe", as: "unsubscribe"
    # patch "customers/withdraw" => "customers#withdraw", as: "withdraw"
  end

  namespace :admin do
    root "homes#top"
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:show, :index, :edit, :update]
    resources :orders, only: [:show,:update]
    resources :order_details, only: [:update]
    resources :items,only:[:index,:new,:create,:show,:edit,:update]
  end

  get "customers" => "public/customers#show", as: "customer"
  get "customers/:id/edit" => "public/customers#edit", as: "edit_customer"
  patch "customers/:id" => "public/customers#update", as: "update_customer"
  get "customers/:id/unsubscribe" => "public/customers#unsubscribe", as: "unsubscribe"
  patch "customers/:id/withdraw" => "public/customers#withdraw", as: "withdraw"

  get "homes/about"=>"public/homes#about"

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end