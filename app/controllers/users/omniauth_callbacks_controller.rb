class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def facebook
    # You need to implement the method below in your model
    @user = User.find_for_facebook_oauth(env["omniauth.auth"], current_user)

    if @user 
      p '----'*20 
      redirect_to root_url, :event => :authentication
    else
      session["devise.facebook_data"] = env["omniauth.auth"]
      redirect_to '/'
    end
  end
  
end