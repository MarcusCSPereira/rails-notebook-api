class PhonesSerializer < ActiveModel::Serializer
  attributes :id, :number

  # Associations
  # belongs_to :contact
end
