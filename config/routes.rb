Rails.application.routes.draw do
  root 'homes#index'
  get "products/index"
  resources :products
  resources :checkouts, only: [:create]
  get "/auth/github/callback", to: "sessions#create"
  delete "/logout", to: "sessions#delete"
end
