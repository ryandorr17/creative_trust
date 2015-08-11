class UsersController < ApplicationController

  def sign_in
    User.login(user_params)

  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
