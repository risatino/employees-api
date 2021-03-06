Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/employees' => 'employees#index'
      post '/employees/' => 'employees#create'
      get '/employees/:id' => 'employees#show'
      get '/employees/:id/edit' => 'employees#edit'
      patch '/employees/:id' => 'employees#update'
      delete '/employees/:id' => 'employees#destroy'
    end 

    namespace :v2 do
      get '/employees' => 'employees#index'
      post '/employees/' => 'employees#create'
      get '/employees/:id' => 'employees#show'
      get '/employees/:id/edit' => 'employees#edit'
      patch '/employees/:id' => 'employees#update'
      delete '/employees/:id' => 'employees#destroy'
    end 
  end

  get '/employees/:id' => 'employees#show'
end
