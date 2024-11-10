class PagesController < ApplicationController
  def home
    puts "reading JSON File"
    file = File.read('./storage/history.json')
    puts "Converting JSON File"
    data_hash = JSON.parse(file)
    puts data_hash['header']['msgversion']
  end

  def FlightDetails(data_hash)
    carrier = data_hash['criteria']['carrier']
    flight = data_hash['criteria']['flightNumber']
    date = data_hash['criteria']['flightDate']
    origin = data_hash['criteria']['boardpoint']
  end
end
