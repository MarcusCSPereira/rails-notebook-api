class PhoneSerializer < ActiveModel::Serializer
  attributes :id, :number

  # Associations
  belongs_to :contact do
    link(:related) { contact_url(object.contact.id) }
  end
end
