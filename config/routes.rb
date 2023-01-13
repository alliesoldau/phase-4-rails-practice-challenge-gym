Rails.application.routes.draw do
  resources :memberships, only: [:create]
  resources :gyms, only: [:show, :destroy]
  resources :clients, only: [:show]
end
