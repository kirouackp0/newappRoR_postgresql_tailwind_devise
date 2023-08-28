Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
     get 'static_pages/index'
     get 'static_pages/secret'

  # Defines the root path route ("/")
   root "static_pages#index"
   
end
