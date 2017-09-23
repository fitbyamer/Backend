Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  get 'members/search', to: 'members#search'
  resources :members

  namespace :api, defaults: {subdomain: :api, format: :json}, path: '/api/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      post 'user/signup', to: 'users#create'
      post 'user/login', to: 'tokens#create'
    end
  end
end
