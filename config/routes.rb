Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions

  root to: "home#index"
end
