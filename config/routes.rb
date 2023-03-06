Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root to: "posts#index"
  post "posts/upload_image", to: "posts#upload_image"

  resources :posts do
    resources :comments
  end
  resources :reactions
  resources :users
end
