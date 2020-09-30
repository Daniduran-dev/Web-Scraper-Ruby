require_relative '../lib/scraper_engine.rb'

class ScraperInterface
  def process
    puts welcome
    prompt
  end

  private

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
    "\nThis scraper for World of Manufacturers site database is going to generate a list of aluminum manufacturers\n"
  end

  def question
    ask = 'Ready to start scrapping? (y/n)'
    "\n**** This will take a while. We will look through the whole database to create an updated list ****\n\n\n#{ask}"
  end

  def file_done
    "\n**** CSV file created ****\n\nYou will find a file named aluminum_suppliers.csv in this folder\n\n"
  end
end

new_list = ScraperInterface.new
new_list.process
