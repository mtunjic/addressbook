class Address < ApplicationRecord
  belongs_to :contact
  geocoded_by :address
  # validations
  #validates :street, presence: true
  composed_of :geolocation,
              class_name: "GeoLocation",
              mapping: [%w(name name),
                        %w(street street),
                        %w(city city),
                        %w(state state),
                        %w(zip_code zip_code)]

  def ==(other_address)
    city == other_address.city && street == other_address.street
  end

  def to_s
    [street, city, state, zip_code].compact.join(', ')
  end
end
