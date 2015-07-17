Rails.application.routes.draw do
  devise_for :users
    devise_scope :user do
      authenticated :user do
        root :to => 'skills#index', as: :authenticated_root
      end
      unauthenticated :user do
        root :to => 'devise/registrations#new', as: :unauthenticated_root
      end
    end
  resources :skills do
    resources :projects, :except => [:show, :index]
  end
  resources :posts do
    resources :comments
  end
  resources :recommendations
end
