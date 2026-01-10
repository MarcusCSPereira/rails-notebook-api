module V1
  class KindSerializer < ActiveModel::Serializer
  attributes :id, :description

  # Associations
  # has_many :contacts
  end
end
