Rails.application.routes.draw do
  resources :memberships, only: [:create]
  resources :gyms, only: [:show, :destroy, :index, :update]
  resources :clients, only: [:show, :index, :update]
end
