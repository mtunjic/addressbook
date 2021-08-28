class Phone < ApplicationRecord
  belongs_to :contact
  before_save :normalize_phone
  # validations
  validates :number, phone: { possible: true, allow_blank: true,
                              types: [:voip, :mobile] }
                              #country_specifier: ->phone { phone.country.try(:upcase) } }

  def formatted_phone
    phone = Phonelib.parse(number)
    if phone.invalid?
      self[:phone]
    else
      phone.full_national
    end
  end

  private

  def normalize_phone
    self.number = Phonelib.parse(number).full_e164.presence
  end
end
