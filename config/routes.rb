Rails.application.routes.draw do
resources :posts
root "users#index"

#user routes
get "users" => "users#index"
post "users" => "users#create"
get "/signup" => "users#new"

#session routes
get "login" => "sessions#new"
post "login" => "sessions#create"
delete "logout" => "sessions#destroy"

#post routes
get "posts/" => "posts#index" 
get "posts/new" => "posts#new" #as: :new_post 
get "posts/:id" => "posts#show" #, as: :post
post "posts/" => "posts#create"
get "posts/:id/edit" => "posts#edit" #, as: :edit_post
post "posts/:id/edit" => "posts#update"
patch "posts/:id" => "posts#update"
delete "posts/:id" => "posts#destroy"

end
