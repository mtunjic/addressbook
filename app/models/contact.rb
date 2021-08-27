class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :addresses, dependent: :destroy
  has_many :phones, dependent: :destroy

  has_one_attached :avatar_image
  # validations
  validates :first_name, :email, presence: true

  # nested attrs
  accepts_nested_attributes_for :addresses, 
                  allow_destroy: true, 
                  reject_if: proc { |attr| attr['street'].blank? } 

  accepts_nested_attributes_for :phones,  
                  allow_destroy: true, 
                  reject_if: proc { |attr| attr['number'].blank? }

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
