module V1
  class ContactSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :birthdate

    # Associations with Hateoas
    belongs_to :kind, optional: true do
      link(:self) { v1_contact_relationships_kind_url(object.id) }
      link(:related) { v1_contact_kind_url(object.id) }
    end

    has_many :phones do
      link(:self) { v1_contact_relationships_phones_url(object.id) }
      link(:related) { v1_contact_phones_url(object.id) }
    end

    has_one :address, inverse_of: :contact do
      link(:self) { v1_contact_relationships_address_url(object.id) }
      link(:related) { v1_contact_address_url(object.id) }
    end

    # Hateoas
    # link(:self) { contact_url(object) }

    # Attributes as_json
    def attributes(*args)
      h = super(*args)
      # h[:birthdate] = (I18n.l(object.birthdate) if object.birthdate)
      h[:birthdate] = object.birthdate.to_time.iso8601 if object.birthdate
      h
    end

    # Meta data
    meta do
      { author: :author }
    end

    # Meta data methods
    def author
      "Marcus César"
    end
  end
end
