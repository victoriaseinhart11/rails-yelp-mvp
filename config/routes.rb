Rails.application.routes.draw do
  get 'restaurants/index'
  get 'restaurants/new'
  get 'restaurants/create'
  get 'restaurants/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # Un visitante puede ver la lista de todos los restaurantes.
  # get "restaurants", to: "restaurants#index"

  # Un visitante puede agregar un nuevo restaurante y ser redireccionado a la vista show de ese nuevo restaurante.
  # get "restaurants/new", to: "restaurants#new"
  # post "restaurants", to: "restaurants#create"

  # Un visitante puede ver los detalles de un restaurante con todos sus reviews.
  # get "restaurants/:id", to: "restaurants#show", as: :restaurant

  # Un visitante puede agregar un review a un restaurante.
  # get "restaurants/:id/reviews/new", to: "reviews#new"
  # post "restaurants/:id/reviews", to: "reviews#create"
  # rails routes -c restaurants
  resources :restaurant, only: [:index, :new, :create, :show] do
   resources :reviews, only: [:new, :create]
  end
end
