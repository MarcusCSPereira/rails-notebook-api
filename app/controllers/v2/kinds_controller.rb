module V2
  class KindsController < ApplicationController
  # TOKEN = ENV.fetch("SECRET_KEY_BASE")
  # include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :set_kind, only: %i[ show update destroy ]
  before_action :authenticate_user!, only: [ :create, :update, :destroy, :index, :show ]

  # GET /kinds
  def index
    @kinds = Kind.all

    render json: @kinds
  end

  # GET /kinds/1
  # GET /contacts/:contact_id/kind
  # GET /contacts/:contact_id/relationships/kind
  def show
    render json: @kind
  end

  # POST /kinds
  def create
    @kind = Kind.new(kind_params)

    if @kind.save
      render json: @kind, status: :created, location: @kind
    else
      render json: @kind.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /kinds/1
  def update
    if @kind.update(kind_params)
      render json: @kind
    else
      render json: @kind.errors, status: :unprocessable_content
    end
  end

  # DELETE /kinds/1
  def destroy
    @kind.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kind
      if params[:contact_id]
        @kind = Contact.find(params[:contact_id]).kind
      elsif params[:id]
        @kind = Kind.find(params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def kind_params
      params.expect(kind: [ :description ])
    end

    # def authenticate
    #   authenticate_or_request_with_http_token do |token, options|
    #     hmac_secret = ENV.fetch("SECRET_KEY_BASE")
    #     begin
    #       JWT.decode token, hmac_secret, true, { algorithm: "HS256" }
    #     rescue JWT::DecodeError
    #       head :unauthorized
    #     end
    #   end
    # end
  end
end
