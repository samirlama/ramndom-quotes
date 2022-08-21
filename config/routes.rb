Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "quotes#index"

  resources :quotes, only: [], path: '' do
    collection { get 'quote', to: "quotes#quote"}
  end
end
