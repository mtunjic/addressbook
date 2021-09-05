require 'bigdecimal'

class GeoLocation
  attr_accessor :name, :address, :latitude, :longitude

  def initialize(name, street, city, state, zip)
    @name, @address = name, street
    perform_geocoding
  end

  def close_to?(other_geo_loc)
    # TODO: test code 
    city == other_address.city
  end

  def distance_to(other_geo_loc)
    # TODO: The Haversine formula 
  end
  

  def perform_geocoding
    # TODO:
    coord = Geocoder.search(@address).first
   # binding.pry

    if coord
      @latitude, @longitude = coord.latitude, coord.longitude
    else  
      @latitude, @longitude = 0.0, 0.0
    end
    puts "===>>> lat #{coord.try(:latitude)}, lgn: #{coord.try(:longitude)}"
  end
end