Rails.application.routes.draw do
    #authenticated :user do
    root 'home#index' #as: :authenticated_root
  #end

  #root "home#landing"

  #root "home#index"
  resources :home do
    collection do
      get 'landing'
      post 'landing'
    end
  end
  resources :works
  resources :contacts
  resources :educations
  resources :social_info
  resources :phones
  resources :emails
  resources :labels
  devise_for :users, path: "MyPata",  path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'sign_up'}
 
  get "/:nick" => "profile#show"
  get "/profile/menu", to: "profile#menu"
  get "/:nick/add", to:"profile#add_contact", as: 'add_contact'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
