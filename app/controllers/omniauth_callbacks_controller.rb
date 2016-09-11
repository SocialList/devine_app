class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :authenticate_user!
  # prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
  # before_action :authenticate_user!

  def all
    auth = request.env['omniauth.auth']
    @authorization = Authorization.find_with_omniauth(auth)
    if @authorization.nil?
      # If no identity was found, create a brand new one here
      @authorization = Authorization.create_with_omniauth(auth)
    end
    if signed_in?
      if @authorization.user == current_user
        # User is signed in so they are trying to link an identity with their
        # account. But we found the identity and the user associated with it
        # is the current user. So the identity is already associated with
        # this user. So let's display an error message.
        sign_in_and_redirect(@authorization.user), notice: "Already linked that account!"
      else
        # The identity is not associated with the current_user so lets
        # associate the identity
        @authorization.user = current_user
        @authorization.save
        sign_in_and_redirect(@authorization.user)
        flash[:notice] = "Successfully linked that account!"
      end
    else
      if @authorization.user.present?
        # The identity we found had a user associated with it so let's
        # just log them in here
        self.current_user = @authorization.user
        sign_in_and_redirect(@authorization.user)
        flash[:notice] = "Signed in!"
      else
        # No user associated with the identity so we need to create a new one
        # user = User.from_omniauth(auth, current_user)
        session["devise.user_attributes"] = @authorization.user.attributes if session["devise.user_attributes"]
        session["callback.user_attributes"] = auth
  			redirect_to new_user_authorization_url
        flash[:notice] = "Please finish sign up"
      end
    end

	# 	user = User.from_omniauth(auth, current_user)
	# 	if user.persisted?
	# 		flash[:notice] = "You are in..!!! Go to edit profile to see the status for the accounts"
	# 		sign_in_and_redirect(user)
	# 	else
	# 		session["devise.user_attributes"] = user.attributes
	# 		redirect_to new_user_registration_url
	# 	end
	end

  def failure
    #handle you logic here..
    #and delegate to super.
    super
  end



	alias_method :github, :all
  alias_method :passthru, :all

end
