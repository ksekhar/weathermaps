class WeatherResult

  attr_accessor :weather_request, :weather_response, :lat_lon_list, :weather_lat_lon

  def initialize(lat_lon_list)
    @weather_request = WeatherRequest.new
    @lat_lon_list = lat_lon_list
  end

  def process_result
    listlatlon = []
    weatherlatlon = []
    @lat_lon_list.each{|k|
      begin_end = k.scan(/\d+\.\d+|-\d+\.\d+/)
      weatherlatlon << [(begin_end[0].to_f * 1000000).to_i, (begin_end[1].to_f * 1000000).to_i]
      weatherlatlon << [(begin_end[2].to_f * 1000000).to_i, (begin_end[3].to_f * 1000000).to_i]
      listlatlon << [begin_end[0], begin_end[1]]
      listlatlon << [begin_end[2], begin_end[3]]
    }
    listlatlon.delete(listlatlon.first)
    listlatlon.delete(listlatlon.last)
    @weather_lat_lon = weatherlatlon
    @lat_lon_list = listlatlon
  end

  def process_weather
    response = []
    @weather_lat_lon.each do |lat_lon|
      response << @weather_request.get_weather(lat_lon)
    end
    response
  end
end