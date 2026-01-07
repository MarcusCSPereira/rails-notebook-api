Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :kinds
  resources :contacts do
    resource :kind, only: [ :show ]
    get "relationships/kind", to: "kinds#show"

    resources :phones, only: [ :index, :show ]
    resource :phone, only: [ :create, :update, :destroy ]
    get "relationships/phones", to: "phones#index"

    resource :address, only: [ :show, :update, :create, :destroy ]
    get "relationships/address", to: "addresses#show"
  end

  resources :auths, only: [ :create ]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
