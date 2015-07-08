require 'open-uri'
require 'json'

class ApiController < ApplicationController
  def weather_form
  end

  def weather_output
    # preprocesses form info
    address = URI.encode(params["address"])

    # dynamically generates URL
    url = "http://api.openweathermap.org/data/2.5/weather?q=#{address}"

    # saves information at the generated URL
    initial_info = open(url).read

    # converts the result into Ruby hashes and arrays
    parsed_info = JSON.parse(initial_info)

    @result = parsed_info["weather"][0]["main"]
    @icon = parsed_info["weather"][0]["icon"]
    @wind_speed = parsed_info['wind']['speed']
    @wind_dir = parsed_info['wind']['deg']
    @current_temp_kelvin = parsed_info['main']['temp']
    @current_temp_farenheit = (@current_temp_kelvin - 273.15)* 1.8000 + 32.00
  end
end
