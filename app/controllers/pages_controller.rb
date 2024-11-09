class PagesController < ApplicationController
  def home
    puts "reading JSON File"
    file = File.read('./storage/history.json')
    puts "Converting JSON File"
    data_hash = JSON.parse(file)
  end
end
