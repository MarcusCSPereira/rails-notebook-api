class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  # Associations
  belongs_to :kind, optional: true do
    link(:related) { kind_url(object.kind.id) }
  end
  has_many :phones
  has_one :address, inverse_of: :contact

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
