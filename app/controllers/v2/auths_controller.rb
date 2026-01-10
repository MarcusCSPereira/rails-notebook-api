module V2
  class AuthsController < ApplicationController
    # def create
    #   hmac_secret = ENV.fetch("SECRET_KEY_BASE")
    #   expires_in = 30.seconds.to_i
    #   payload ={ name: params[:name].to_s, exp: Time.now.to_i + expires_in }
    #   token = JWT.encode payload, hmac_secret, "HS256"
    #   render json: { token: token }
    # end
  end
end
