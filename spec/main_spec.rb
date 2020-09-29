require_relative '../bin/main.rb'

# let(:scraperinterface) { ScraperInterface.new }
let(:answer) { 'y' }
# rubocop:disable Layout/LineLength
describe ScraperInterface do
  # describe '#welcome' do
  #   it 'returns a string' do
  #     expect(scraperinterface.welcome).to eql "\nThis scraper for World of Manufacturers site database is going to generate a list of aluminum manufacturers\n"
  #   end
  #   it 'checks that it is not nil' do
  #     expect(scraperinterface.welcome).not_to be_nil
  #   end
  # end

  # describe '#question' do
  #   it 'returns a string' do
  #     expect(scraperinterface.question).to eql "\n***** This will take a while since we will look through the whole database to give you an updated list *****\n\n\nReady to start scrapping? (y/n)"
  #   end
  #   it 'checks that it is not nil' do
  #     expect(scraperinterface.question).not_to be_nil
  #   end
  # end

  describe '#file_done' do
    it 'returns a string' do
      expect(scraperinterface.file_done).to eql "\n**** CSV file created ****\n\nYou will find a file named aluminum_suppliers.csv in this folder\n\n"
    end
    it 'checks that it is not nil' do
      expect(scraperinterface.file_done).not_to be_nil
    end
  end
  # rubocop:enable Layout/LineLength
end
