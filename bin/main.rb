require 'pry'
require_relative '../lib/scraper_engine.rb'

class ScraperInterface
  def start
    welcome
    prompt
  end

  def prompt
    puts question
    loop do
      answer = gets.chomp.downcase.to_s
      if answer == 'y'
        create = ScraperEngine.new
        create.process_suppliers
        puts file_done
        break
      elsif answer == 'n'
        puts 'Goodbye, see you soon'
        break
      else
        puts 'Please just type y for yes, or n for no'
      end
    end
  end

  def welcome
    puts ''
    puts 'This scraper for World of Manufacturers site database is going to generate a list of aluminum manufacturers'
    puts ''
  end

  def question
    ask = " \n***** This will take a while since we will look through the whole database to give you an updated list *****\n \n \nReady to start scrapping? (y/n)"
  end

  def file_done
    text = " \n**** CSV file created ****\n \nYou will find a file named aluminum_suppliers.csv in this directory\n \n"
  end
end

new_list = ScraperInterface.new
new_list.start
