Rails.application.routes.draw do
  resources :characters
  resources :milis, only: [:index]
  resources :deles, only: [:index]
  resources :domains do
    get :test, on: :collection
  end
end
