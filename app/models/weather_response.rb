require 'rexml/document'
include REXML
class WeatherResponse
  attr_accessor :response, :current_conditions, :forecast_conditions, :lat, :long
  
  def initialize(response)
    @response = Document.new(response)
    root = @response.root
    @current_conditions = {}
    @current_conditions[:condition] = root.elements["weather/current_conditions/condition"].attributes["data"]
    @current_conditions[:temp_f] = root.elements["weather/current_conditions/temp_f"].attributes["data"]
    @current_conditions[:temp_c] = root.elements["weather/current_conditions/temp_c"].attributes["data"]
    @current_conditions[:icon] = root.elements["weather/current_conditions/icon"].attributes["data"]
    @lat = (root.elements["weather/forecast_information/latitude_e6"].attributes["data"].to_f / 1000000)
    @long = (root.elements["weather/forecast_information/longitude_e6"].attributes["data"].to_f / 1000000)
  end
  
  def icon(lat,long)
    if @lat == lat.to_f.round(5) && @long == long.to_f.round(5)
      @current_conditions[:icon]
    else
      nil
    end
  end
  
end