class PagesController < ApplicationController
  def home
    # Reading the JSON File (for now always the same file)
    puts "reading JSON File"
    file = File.read('./storage/history.json')
    # Converting the JSON file
    puts "Converting JSON File"
    data_hash = JSON.parse(file)
    data = JSON.parse(file, symbolize_names: true)
    # Grabbing the Flight Details
    @flight_details = FlightDetails(data_hash)
    puts RegoChanges(data)
  end

  def FlightDetails(data_hash)
    carrier = data_hash['criteria']['carrier']
    flight = data_hash['criteria']['flightNumber']
    date = DateTime.parse(data_hash['criteria']['flightDate']).to_date.strftime("%d%^b")
    origin = data_hash['criteria']['boardpoint']
    return "#{carrier}#{flight}/#{date} Origin:#{origin}"
  end

  def RegoChanges(data_hash)
    results = []

    data_hash[:hist].each do |entry|
      if entry[:app] == "DCS"
        entry[:data].each do |data_item|
          if data_item[:type] == "Free Text" && data_item[:value].is_a?(Array)
            data_item[:value].each do |value|
              results << value if value.start_with?("Registration changed")
            end
          end
        end
      end
    end
    # return the array results that contain all the registration changes
    return results
  end

end
