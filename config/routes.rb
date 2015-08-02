Rails.application.routes.draw do
resources :posts
root "sessions#index"

#user routes
get "users" => "users#index"
post "users" => "users#create"
get "/signup" => "users#new"


#session routes
get "home" => "sessions#index"
get "login" => "sessions#new"
post "login" => "sessions#create"
delete "logout" => "sessions#destroy"

#post routes
get "posts/" => "posts#index" 
get "posts/:id/earn" => "posts#earned", as: :earn_post
get "users/:id/posts/new" => "posts#new" #as: :new_post 
get "posts/:id" => "posts#show" #, as: :post
post "users/:id/posts/" => "posts#create"
get "posts/:id/edit" => "posts#edit" #, as: :edit_post
post "posts/:id/edit" => "posts#update"
patch "posts/:id" => "posts#update"
delete "posts/:id" => "posts#destroy"

#role routes

get "roles/" => "roles#index"
get "roles/new" => "roles#new", as: :new_role
post "roles/" => "roles#create"

end
