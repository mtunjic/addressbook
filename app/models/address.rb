class Address < ApplicationRecord
  belongs_to :contact

  # validations
  #validates :street, presence: true
end
