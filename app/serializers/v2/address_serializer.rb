module V2
  class AddressSerializer < ActiveModel::Serializer
  attributes :id, :street, :city

  # Associations
  belongs_to :contact do
      link(:related) { v2_contact_url(object.contact.id) }
    end
  end
end
