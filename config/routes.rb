Rails.application.routes.draw do
  resources :skills do
    resources :projects, :except => [:show, :index]
  end
end
