class Avatar < ApplicationRecord

  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :town, presence: true, length: { minimum: 3 }

end
