class User < ActiveRestClient::Base
  base_url Rails.application.config.api_server_url

end
