require 'csv'

class SaveList
  def initialize(supliers_hash)
    @suppliers = supliers_hash
  end

  def generate
    CSV.open('aluminum_suppliers.csv', 'wb') do |csv|
      csv << @suppliers.first.keys # adds the attributes name on the first line
      @suppliers.each do |hash|
        csv << hash.values
      end
    end
  end
end
