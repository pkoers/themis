class PagesController < ApplicationController
  def home
    # Reading the JSON File (for now always the same file)
    puts "reading JSON File"
    file = File.read('./storage/history.json')
    # Converting the JSON file
    puts "Converting JSON File"
    data_hash = JSON.parse(file)
    # Grabbing the Flight Details
    @flight_details = FlightDetails(data_hash)
  end

  def FlightDetails(data_hash)
    carrier = data_hash['criteria']['carrier']
    flight = data_hash['criteria']['flightNumber']
    date = DateTime.parse(data_hash['criteria']['flightDate']).to_date.strftime("%d%^b")
    origin = data_hash['criteria']['boardpoint']
    return "#{carrier}#{flight}/#{date} Origin:#{origin}"
  end
end
