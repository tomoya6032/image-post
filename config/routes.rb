Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
  post "posts/upload_image", to: "posts#upload_image"

  resources :posts do
    resources :comments
  end
  resources :reactions
  resources :users
end
