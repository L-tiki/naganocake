Rails.application.routes.draw do

  devise_for :admins
  devise_for :customers
  root :to =>"public/homes#top"
  get "homes/about"=>"public/homes#about"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
