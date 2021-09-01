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

  def self.by_letter(letter)
    where("last_name LIKE ?", "#{letter}%").order(:last_name)
  end

  def self.alphabetical    
    select(:id, :first_name, :last_name)
      .group_by { |c| c.last_name[0,1].upcase }.sort
  end 

  def self.import_csv(file)

    contacts = []
    CSV.foreach(file.path) do |row|
      create!(user_id: row[0].to_i, first_name: row[1].strip, 
              last_name: row[2].strip, email: row[3].strip, 
              group_id: row[4].to_i)
     # contacts << [Contact.new(first_name: row[0], 
     #             last_name: row[1], email: row[2])] #TODO: add all fileds
    end
    #Contact.import contacts, validate: false

  end

end
