Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#home"
  resources :books
  get 'sign-up', as: :sign_up, to: 'home#sign_up'
  get 'sign-in', to: 'application#sign_in'
end
