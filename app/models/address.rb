class Address < ApplicationRecord
  belongs_to :contact, inverse_of: :address
end
