class Contact < ApplicationRecord
  extend ContactConverter
  extend ContactImporter

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
                                reject_if: proc { |attr| attr["street"].blank? }

  accepts_nested_attributes_for :phones,
                                allow_destroy: true,
                                reject_if: proc { |attr| attr["number"].blank? }

  def name_with_initial
    "#{first_name.first}. #{last_name}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.search(last_name)
    self.where("lower(last_name) LIKE ?", "#{last_name.downcase}%")
    .order(:last_name)
  end

  def self.alphabetical
    select(:id, :first_name, :last_name)
      .group_by { |c| c.last_name[0, 1].upcase }.sort
  end
end
