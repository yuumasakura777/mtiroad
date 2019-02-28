Rails.application.routes.draw do
  
  
  get "/log",to:"users#log"
  post "/login",to:"users#login"
  post "/logout",to:"users#logout"
  
  
  root to:"users#index"
  get "/new",to:"users#new"
  post "/create",to:"users#create"
  
  get "/login",to:"users#login_form"
  
  get"/rank1",to:"ranks#rank1"
  get"/rank2",to:"ranks#rank2"
  get"/rank3",to:"ranks#rank3"
  get"/rank4",to:"ranks#rank4"
  get"/rank5",to:"ranks#rank5"
  
  get"/show",to:"posts#show"
  get"/ecreate",to:"posts#ecreate"
  post"/kcreate",to:"posts#kcreate"
  get "/posts/:id/edit",to:"posts#edit"
  patch"/posts/:id",to:"posts#update"
  delete "/posts/:id",to:"posts#destroy"
  
  
 
end
