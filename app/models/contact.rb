class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :addresses, dependent: :destroy
  has_many :phones, dependent: :destroy

	validates :first_name, :email, presence: true
  accepts_nested_attributes_for :addresses 
  accepts_nested_attributes_for :phones
end
