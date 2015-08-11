class UsersController < ApplicationController

  def sign_in

    # i'm unable to access the api documenation at this time, I'm assuming the login
    # method accepts a hash and returns nil if not valid
    user = User.login(user_params)

    if user
     # Log the user in and redirect to the user's show page.
    else
     # Create an error message.
     render 'new'
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
