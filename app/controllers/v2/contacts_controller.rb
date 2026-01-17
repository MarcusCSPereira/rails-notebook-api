module V2
  class ContactsController < ApplicationController
    include ErrorSerializer
    before_action :set_contact, only: %i[ show update destroy ]

    # GET /contacts
    def index
      @contacts = Contact.includes(:kind, :phones, :address).all

      # Cache Configuration
      expires_in 30.seconds, public: true
      if stale?(etag: @contacts, last_modified: @contacts.maximum(:updated_at))
        render json: @contacts
      end
    end

    # GET /contacts/1
    def show
      render json: @contact, include: [ :kind, :phones, :address ]
    end

    # POST /contacts
    def create
      @contact = Contact.new(contact_params)

      if @contact.save
        render json: @contact, status: :created, location: @contact
      else
        render json: ErrorSerializer.serialize(@contact.errors), status: :unprocessable_content
      end
    end

    # PATCH/PUT /contacts/1
    def update
      if @contact.update(contact_params)
        render json: @contact
      else
        render json: ErrorSerializer.serialize(@contact.errors), status: :unprocessable_content
      end
    end

    # DELETE /contacts/1
    def destroy
      @contact.destroy!
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_contact
        @contact = Contact.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def contact_params
        # params.require(:contact).permit(
        #   :name, :email, :birthdate,
        #   :kind_id,
        #   phones_attributes: [ :id, :number, :_destroy ],
        #   address_attributes: [ :id, :street, :city ]
        # )
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      end
  end
end
