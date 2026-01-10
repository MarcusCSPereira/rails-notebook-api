class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :ensure_json_request

  def ensure_json_request
    unless request.headers["Accept"] =~ /vnd\.api\+json/
      head :not_acceptable
    else
      unless request.get?
        unless request.headers["Content-Type"] =~ /vnd\.api\+json/
          head :unsupported_media_type
        end
      end
    end
  end
end
