Habittracker::Application.routes.draw do
  
  match "/challenges" => "challenges#index"

  match "/challenges/1" => "challenges#show"
  
  match '/test' => "home#test"
  
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
