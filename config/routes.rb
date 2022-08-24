 Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/contact', to: "root#contactmethod"
  get '/about', to: "root#aboutmethod"
  #get '/index' , to: "root#indexmethod"
  #get '/index', to: "root#index"
  root "root#indexmethod" #use root instead of get to change the homepage (localhost:3000)
  #^ root has nothing to do with root controller--> inside "root#index"
  get '/response' , to: "root#api"
  get '/response2' , to: "root#api2"
  get '/user/:id/:name' , to: "root#user"
  post '/add' , to: "root#addmethod"
  post '/delete' , to: "root#deletemethod"
end
