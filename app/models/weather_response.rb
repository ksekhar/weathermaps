#require 'rexml/document'
#include REXML
require 'nokogiri'
class WeatherResponse
  attr_accessor :response, :current_conditions, :forecast_conditions, :lat, :long
  
  def initialize(response)
    @response = Nokogiri::XML(response)
    @current_conditions = {}
    @current_conditions[:condition] = @response.css("current_conditions condition").first.attributes["data"].value
    @current_conditions[:temp_f] = @response.css("current_conditions temp_f").first.attributes["data"].value
    @current_conditions[:temp_c] = @response.css("current_conditions temp_c").first.attributes["data"].value
    @current_conditions[:icon] = @response.css("current_conditions icon").first.attributes["data"].value
    @lat = (@response.css("weather forecast_information latitude_e6").first.attributes["data"].value.to_f / 1000000)
    @long = (@response.css("weather forecast_information longitude_e6").first.attributes["data"].value.to_f / 1000000)
  end
  
  def icon(lat,long)
    if @lat == lat.to_f.round(5) && @long == long.to_f.round(5)
      @current_conditions[:icon]
    else
      nil
    end
  end
  
end