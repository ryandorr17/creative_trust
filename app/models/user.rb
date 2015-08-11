class User < ActiveRestClient::Base
  base_url Rails.application.config.api_server_url

  get :find, '/users/:id'
  get :login, '/login?email=:email&password=:password'

end
