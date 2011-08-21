Habittracker::Application.routes.draw do
  
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :habits do
     member do
       post 'checkin'
     end
  end
  
  
  match "/" => "home#index"
  
  match "/habits/.:format" => "habits#create", :method => :post

  root :to => "habits#index"

end
