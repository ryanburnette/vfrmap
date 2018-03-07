require 'vfrmap/version'
require 'vfrmap/location'
require 'uri'
require 'addressable/uri'
require 'padrino-helpers'
require 'open-uri'
require 'base64'

class Vfrmap
  include Padrino::Helpers::TagHelpers

  DEFAULT_OPTIONS = {
    type: 'vfrc',
    zoom: 10,
    width: 350,
    height: 350,
    class: nil,
    alt: nil
  }

  attr_accessor :options

  def initialize(location_string,options={})
    @location = Location.factory(location_string)
    raise 'Invalid location' unless @location
    @options = DEFAULT_OPTIONS.merge(options)
  end

  def uri
    URI::HTTP
      .build(host: 'vfrmap.com', path: '/api', query: query_params)
      .to_s
  end
  alias_method :src, :uri

  def to_html
    tag(:img, src: src, class: @options[:class], alt: @options[:alt])
  end

  def to_jpg
    open(uri).read
  end

  def to_base64_jpg
    Base64.encode64(to_jpg)
  end

  private

  def location
    @location
  end

  def latitude
    case
    when @location.is_a?(Geo::Coord)
      (@location.to_h[:lat]*10000000).round / 10000000.0
    when @location.is_a?(Airports::Airport)
      @location.latitude.to_f
    end
  end

  def longitude
    case
    when @location.is_a?(Geo::Coord)
      (@location.to_h[:lng]*10000000).round / 10000000.0
    when @location.is_a?(Airports::Airport)
      @location.longitude.to_f
    end
  end

  def query_params
    uri = Addressable::URI.new
    uri.query_values = {
      req:    'map',
      type:   @options[:type],
      lat:    latitude,
      lon:    longitude,
      zoom:   @options[:zoom],
      width:  @options[:width],
      height: @options[:height]
    }
    uri.query
  end
end
