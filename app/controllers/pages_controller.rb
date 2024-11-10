class PagesController < ApplicationController
  def home
    puts "reading JSON File"
    file = File.read('./storage/history.json')
    puts "Converting JSON File"
    data_hash = JSON.parse(file)
    puts data_hash['header']['msgversion']
    flight_details = FlightDetails(data_hash)
    puts flight_details
  end

  def FlightDetails(data_hash)
    carrier = data_hash['criteria']['carrier']
    flight = data_hash['criteria']['flightNumber']
    date = DateTime.parse(data_hash['criteria']['flightDate']).to_date.strftime("%d%^b")
    origin = data_hash['criteria']['boardpoint']
    return "#{carrier}#{flight}/#{date} Origin:#{origin}"
  end
end
