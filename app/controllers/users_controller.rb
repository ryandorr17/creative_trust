class UsersController < ApplicationController

  def sign_in

    # i'm unable to access the api documenation at this time, I'm assuming the login
    # method accepts a hash and
    #####
    ##  Big Assumption: returns nil if not valid
    ####
    user = User.login(user_params)

    if user
      session[:user_id] = user.id
      current_user
      redirect_to videos_path
    else
     flash.now[:danger] = 'Invalid email/password combination'
     render 'sign_in'
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
