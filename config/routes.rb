Rails.application.routes.draw do
  resources :skills do
    resource :projects
  end
end
