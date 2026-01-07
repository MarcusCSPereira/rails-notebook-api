class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :ensure_json_request

  def ensure_json_request
    unless request.headers["Accept"] =~ /json/
      head :not_acceptable
    end
  end
end
