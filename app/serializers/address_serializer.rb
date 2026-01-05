class AddressSerializer < ActiveModel::Serializer
  attributes :id, :street, :city

  # Associations
  # belongs_to :contact
end
