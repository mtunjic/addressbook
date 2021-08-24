class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :addresses, dependent: :destroy
  has_many :phones, dependent: :destroy

	validates :first_name, :email, presence: true
  accepts_nested_attributes_for :addresses 
  accepts_nested_attributes_for :phones

  def name_with_initial
    "#{first_name.first}. #{last_name}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.by_letter(letter)
    where("last_name LIKE ?", "#{letter}%").order(:last_name)
  end

  after_initialize do 
    addresses.build
    phones.build 
  end
  
end
