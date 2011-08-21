class User::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @user = User.find_for_facebook_oauth(env["omniauth.auth"], current_user)
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect '/', :event => :authentication
    else
      session["devise.facebook_data"] = env["omniauth.auth"]
      redirect_to '/s'
    end
  end  
  
end
