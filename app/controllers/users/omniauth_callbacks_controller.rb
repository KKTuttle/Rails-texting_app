class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def strava
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    self.custom_auth "strava"
  end

  def facebook
    self.custom_auth "facebook"
  end

  def custom_auth(provider)
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => provider.capitalize) if is_navigational_format?
    else
      session["devise.#{provider.downcase}_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

end
