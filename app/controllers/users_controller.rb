class UsersController < ApplicationController

  def sign_in
  end

  def create_session

    # i'm unable to access the api documenation at this time, I'm assuming the login
    # method accepts a hash and
    #####
    ##  Big Assumption: returns nil if not valid
    ####
    begin
      user = User.login(user_params)
    rescue ActiveRestClient::HTTPNotFoundClientException
      user = nil
      flash.now[:info] = 'Could not reach the API server.'
    end

    if user
      session[:user_id] = user.id
      current_user
      redirect_to videos_path
    else
     flash.now[:danger] = 'Sorry we could not log you in.'
     render 'sign_in'
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
