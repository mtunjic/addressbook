class Group < ApplicationRecord
  has_many :contacts

  #validation
  validates :name, presence: true
end
