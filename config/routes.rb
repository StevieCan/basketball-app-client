Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  
  namespace :client do
    get '/players' => 'players#index'
    get '/players/new' => 'players#new'
    post '/players' => 'players#create'
    get '/players/:id' => 'players#show'
    get '/players/:id/edit' => 'players#edit'
    patch '/players/:id' => 'players#update'
    delete '/players/:id' => 'players#destroy'
  end
end
