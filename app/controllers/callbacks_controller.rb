class CallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])
    flash[:notice] = "You've successfully signed in with Github"
    sign_in_and_redirect @user
  end
end
