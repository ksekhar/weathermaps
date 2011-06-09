class WeatherRequest
  attr_accessor :url, :host

  def initialize
    @host = "www.google.com"
    @url = "/ig/api?weather=,,,"
    @connection = Net::HTTP.new(@host)
    
  end

  def get_weather(lat_lon)
    response = @connection.get(@url + lat_lon.join(","))
    @weather_response = WeatherResponse.new(response.body)
    @weather_response
  end
end