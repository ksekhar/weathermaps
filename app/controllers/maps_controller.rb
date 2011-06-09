class MapsController < ApplicationController

  def show
  end

  def get_weather
    @weather_result = WeatherResult.new(ActiveSupport::JSON.decode(params[:text]))#"Weather Underground","api.wunderground.com","/auto/wui/geo/ForecastXML/index.xml?query="
    @lat_lon = @weather_result.process_result
    @weather_response = @weather_result.process_weather
    respond_to do |format|
      format.js
    end
  end

  def load_weather
    
  end
end