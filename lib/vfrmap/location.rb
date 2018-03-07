require 'geo/coord'
require 'airports'

class Vfrmap::Location
  def self.factory(location_string)
    coordinates = try_coordinates(location_string)
    return coordinates if coordinates

    airport = try_airport(location_string)
    return airport if airport
  end

  private

  def self.try_coordinates(location_string)
    Geo::Coord.parse(location_string)
  end

  def self.try_airport(location_string)
    Airports.find_by_iata_code(location_string.upcase)
  end
end
