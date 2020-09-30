require 'nokogiri'
require 'open-uri'

require_relative '../lib/csv_generator.rb'

class ScraperEngine
  attr_reader(:page, :url, :aluminum_suppliers, :supplier, :supplier_list, :parsed_page)

  def initialize
    target_url
    parse_url(@url)
    create_supplier_list
    @aluminum_suppliers = []
    @page = 1
  end

  def process_suppliers
    target_url
    parse_url(@url)
    create_supplier_list
    total_number_pages
    display
  end

  def target_url
    @url = 'http://worldofmanufacturers.com/metals/aluminum'
  end

  def parse_url(target)
    unparsed_page = URI.open(target)
    @parsed_page = Nokogiri::HTML(unparsed_page)
  end

  def create_supplier_list
    @supplier_list = @parsed_page.css('div.panel-default')
  end

  def total_number_pages
    per_page = @supplier_list.count
    total_suppliers = @parsed_page.css('div.content p')[1].children[3].children.text.to_i
    @total_pages = (total_suppliers / per_page.to_f).round
  end

  def display
    while page <= 2
      pagination_url = "http://worldofmanufacturers.com/metals/aluminum/page/#{@page}"
      puts pagination_url
      puts "Page: #{@page}"
      parse_url(pagination_url)
      create_supplier_list
      search
      @page += 1
    end
    aluminum_suppliers_csv = SaveList.new(@aluminum_suppliers)
    aluminum_suppliers_csv.generate
  end

  def search
    @supplier_list.each do |card|
      country_level_a = card.css('div.panel-body')[0].children[4].text.gsub(/\n/, '').rstrip
      country_level_b = country_level_a.split(',')
      country_level_c = country_level_b.last.lstrip
      @supplier = {
        company: card.css('h2 span').text,
        address: card.css('div.panel-body')[0].children[4].text.gsub(/\n/, '').rstrip,
        telephone: card.css('div.panel-body')[0].children[8].text.gsub(/\n/, '').rstrip,
        country: country_level_c
      }
      create_csv
      puts "Added #{@supplier[:company]}"
    end
  end

  def create_csv
    @aluminum_suppliers << @supplier
  end
end
