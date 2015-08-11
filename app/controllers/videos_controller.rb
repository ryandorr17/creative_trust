class VideosController < ApplicationController
  before_filter :sign_in_required, unless: :logged_in?

  def sign_in_required
    redirect_to sign_in_path, notice: 'Please Signin'
  end

  def index
    @videos = Video.featured(session[:auth_token])
  end
end
