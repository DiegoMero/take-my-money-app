Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"

  resources :groups, only: [:index, :new, :create, :show ] do
    resources :investments, only: [:new, :create]
  end
end
