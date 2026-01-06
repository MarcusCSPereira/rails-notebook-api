class PhonesController < ApplicationController
  before_action :set_contact, only: [ :show, :create, :update, :destroy, :index ]

  # GET /phones
  def index
    render json: @contact.phones
  end

  # GET /phones/1
  def show
    render json: @contact.phones.find(params[:id])
  end

  # POST /contacts/:contact_id/phone
  def create
    @contact.phones << Phone.new(phone_params)
    if @contact.save
      render json: @contact.phones, status: :created, location: contact_phones_url(@contact)
    else
      render json: @contact.phones.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /phones/1
  def update
    if @contact.phones.find(phone_params[:id]).update(phone_params)
      render json: @contact.phones
    else
      render json: @contact.phones.errors, status: :unprocessable_content
    end
  end

  # DELETE /phones/1
  def destroy
    @contact.phones.find(phone_params[:id]).destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
        @contact = Contact.find(params[:contact_id])
    end

    def phone_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
