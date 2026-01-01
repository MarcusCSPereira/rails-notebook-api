class Contact < ApplicationRecord
  belongs_to :kind, optional: true

  def age
    (Date.today - birthdate).to_i / 365
  end

  def as_json(options = {})
    super(
      methods: [ :age ],
      root: true,
      except: [ :kind_id ],
      include: { kind: { only: [ :id, :description ] } }
    )
  end
end
