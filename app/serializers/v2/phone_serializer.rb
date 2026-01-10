module V2
  class PhoneSerializer < ActiveModel::Serializer
  attributes :id, :number

  # Associations
  belongs_to :contact do
      link(:related) { v2_contact_url(object.contact.id) }
    end
  end
end
