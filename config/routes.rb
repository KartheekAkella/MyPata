Rails.application.routes.draw do
  root "home#index"
  resources :works
  resources :educations
  resources :social_info
  resources :phones
  resources :emails
  devise_for :users
  get "/:nick" => "profile#show"
  get "/profile/menu" => "profile#menu"
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
