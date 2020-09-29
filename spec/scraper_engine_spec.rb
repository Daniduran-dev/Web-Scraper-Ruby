require_relative '../lib/scraper_engine.rb'

describe ScraperEngine do
  let(:scraper_engine) { ScraperEngine.new }
  let(:url) { 'http://worldofmanufacturers.com/metals/aluminum' }

  describe '#target_url' do
    it 'returns a string with an http address' do
      expect(scraper_engine.target_url).to be_a(String)
    end
    it 'checks if it is not nil' do
      expect(scraper_engine.target_url).not_to be_nil
    end
  end

  describe '#parse_url' do
    it 'is a Nokogiri document class' do
      expect(scraper_engine.parse_url(url)).to be_a(Nokogiri::HTML::Document)
    end
    it 'checks if the method does not return a string' do
      expect(scraper_engine.parse_url(url)).not_to be_a(String)
    end
  end

  describe '#create_supplier_list' do
    it 'creates a Nokogiri doc' do
      expect(scraper_engine.create_supplier_list).to be_a(Nokogiri::XML::NodeSet)
    end
    it 'checks it does not return a string' do
      expect(scraper_engine.create_supplier_list).not_to be_a(String)
    end
  end

  describe '#total_number_pages' do
    it 'gives you a number with the totality of pages to scrap' do
      expect(scraper_engine.total_number_pages).to eql 486
    end
    it 'checks that the object is not nil' do
      expect(scraper_engine.total_number_pages).not_to be_nil
    end
  end
end
