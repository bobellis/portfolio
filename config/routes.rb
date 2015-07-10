Rails.application.routes.draw do
  devise_for :users
  root :to => 'skills#index'
  resources :skills do
    resources :projects, :except => [:show, :index]
  end
end
