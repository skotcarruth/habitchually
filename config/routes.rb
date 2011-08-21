Habittracker::Application.routes.draw do
  resources :habits do
     member do
       post 'checkin'
     end
  end
  
  match "/habits/.:format" => "habits#create", :method => :post

  root :to => "habits#index"

end
