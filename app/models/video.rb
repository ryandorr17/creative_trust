class Video < ActiveRestClient::Base
  base_url Rails.application.config.api_server_url

  get :featured, '/videos/featured'
  
end
