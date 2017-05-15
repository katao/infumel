Rails.application.routes.draw do
  resources :characters
  resources :mili, only: [:index]
  resources :dele, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
