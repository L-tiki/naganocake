Rails.application.routes.draw do

  root :to =>"public/homes#top"

  namespace :public do
    resources :items,only:[:index,:show]
  end

  namespace :admin do
    root "homes#top"
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:show, :index, :edit, :update]
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

  #resources :addresses, only: [:creste, :index, :destroy, :edit, :update]
  get "addresses"=>"public/addresses#index"
  post "addresses"=>"public/addresses#create"
  get "addresses/:id" => "public/addresses#edit", as: "address"
  patch "addresses/:id" => "public/addresses#update"
  delete "addresses/:id" => "public/addresses#destroy"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
