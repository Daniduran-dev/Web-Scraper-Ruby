require 'nokogiri'
require 'open-uri'
require 'pry'

class ScraperEngine

  # attr_accessor(:page, :url)

  def initialize # target_url
    target_url
    parse_url
    # create_supplier_list
  end

  def target_url
    @page = 1
    @url = "http://worldofmanufacturers.com/metals/aluminum/page/#{@page}"
  end

  def parse_url
    unparsed_page = URI.open(@url)
    @parsed_page = Nokogiri::HTML(unparsed_page)
  end

  def create_supplier_list
    @supplier_list = @parsed_page.css('div.panel-default')
  end

  def total_number_pages
    per_page = @supplier_list.count # 10
    total_suppliers = @parsed_page.css('div.content p')[1].children[3].children.text.to_i # 4857
    @total_pages = (total_suppliers / per_page.to_f).round # 486
  end

  def search
    while @page <= @total_pages
      puts "hola #{@page}"
      @page += 1
    end
  end

  def page_number
    @page
  end

  def show_url
    @url
  end

  def order
    target_url
    parse_url
    create_supplier_list
    total_number_pages
  end

end

aluminum = ScraperEngine.new
# aluminum.list
# puts aluminum.show_url
# puts aluminum.page_number
# aluminum.create_supplier_list
# puts aluminum.total_pages
aluminum.order
aluminum.search
