Rails.application.routes.draw do
  root :to =>"public/homes#top"
  namespace :admin do
    root "homes#top"
  end
  get "homes/about"=>"public/homes#about"

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