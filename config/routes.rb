Rails.application.routes.draw do
  resources :users

  delete "/logout", to: "sessions#destroy"
  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/me', to: 'users#show'
end
