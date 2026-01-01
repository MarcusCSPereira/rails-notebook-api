class Contact < ApplicationRecord
  # Associations
  belongs_to :kind, optional: true
  has_many :phones
  has_one :address, inverse_of: :contact

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  def age
    (Date.today - birthdate).to_i / 365
  end

  def as_json(options = {})
    super(
      methods: [ :age ],
      root: true,
      except: [ :kind_id ],
      include: {
        kind: { only: [ :id, :description ] },
        phones: {},
        address: {}
      }
    )
  end
end
