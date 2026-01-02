class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  def attributes(*args)
    h = super(*args)
    # h[:birthdate] = (I18n.l(object.birthdate) if object.birthdate)
    h[:birthdate] = object.birthdate.to_time.iso8601 if object.birthdate
    h
  end
end
