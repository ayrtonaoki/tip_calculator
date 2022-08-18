Rails.application.routes.draw do
  resources :tips
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tips#index"
end
