class Vendor < ApplicationRecord

  belongs_to :avatar, inverse_of: :vendors, required: true

  validates :name, presence: true, length: { minimum: 3 }
  validates :town, presence: true, length: { minimum: 3 }
  validates :description, length: { minimum: 3, allow_blank: true }

end
