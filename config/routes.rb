Rails.application.routes.draw do
  resources :restaurant_pizzas, only: [:index, :create]
  resources :pizzas, only: [:index, :show]
  resources :restaurants, only: [:index, :show, :create, :update, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
