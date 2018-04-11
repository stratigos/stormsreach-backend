class Avatar < ApplicationRecord

  has_many :vendors, inverse_of: :avatar, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :town, presence: true, length: { minimum: 3 }

end
