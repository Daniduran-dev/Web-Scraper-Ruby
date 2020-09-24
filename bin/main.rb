require 'nokogiri'
require 'open-uri'
require 'pry'

class Interface
  def start
    welcome
    prompt
  end

  def welcome
    puts ''
    puts 'This scraper for Lazada.vn will find the best prices and filter the results exclusively for cat litter.'
    puts ''
  end

  def prompt
    puts 'Do you want to start searching for the best prices of cat litter? (y/n)'
    answer = gets.downcase
    if answer == 'y'
      'start search method'
    elsif answer == 'n'
      puts 'Goodbye, see you soon'
      break
    else
      'Please just type y for yes, or n for no'
    end
  end
end

scraper = Interface.new
scraper.together
