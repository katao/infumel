Rails.application.routes.draw do
  resources :characters
  resources :milis, only: [:index]
  resources :deles, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
