Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get '/search', to: "search#index"
  # get '/search', to: "search#show"

  get 'auth/facebook', as: :facebook_login
  get 'auth/facebook/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
