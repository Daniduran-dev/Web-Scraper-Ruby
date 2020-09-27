require 'nokogiri'
require 'open-uri'
class Scraper
  def search
    url = 'http://worldofmanufacturers.com/metals/aluminum'
    unparsed_page = URI.open(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    aluminum_suppliers = []
    supplier_list = parsed_page.css('div.panel-default')
    page = 1
    per_page = supplier_list.count # 10
    total = parsed_page.css('div.content p')[1].children[3].children.text.to_i # 4857
    last_page = (total / per_page.to_f).round # 486

    while page <= last_page
      pagination_url = "http://worldofmanufacturers.com/metals/aluminum/page/#{page}"
      puts pagination_url
      puts "Page: #{page}"
      puts ''
      pagination_unparsed_page = URI.open(pagination_url)
      pagination_parsed_page = Nokogiri::HTML(pagination_unparsed_page)
      pagination_supplier_list = pagination_parsed_page.css('div.panel-default')
      
      pagination_supplier_list.each do |card|
        supplier = {
          company: card.css('h2 span').text,
          address: card.css('div.panel-body')[0].children[4].text.gsub(/\n/, '').rstrip,
          telephone: card.css('div.panel-body')[0].children[8].text.gsub(/\n/, '').rstrip,
          country: ((card.css('div.panel-body')[0].children[4].text.gsub(/\n/, '').rstrip).split(',')).last.lstrip
        }
        aluminum_suppliers << supplier
        puts "Added #{supplier[:company]}"
        puts ''
      end
      page += 1
    
    end

  end
end

scraper = Scraper.new
scraper.search
