require_relative '../lib/generate_csv.rb'

describe SaveList do
  let(:array) { [key1: 'string', key2: 'test', key3: 'mock'] }
  let(:savelist) { SaveList.new(array) }
  describe '#generate' do
    it 'checks that something is created' do
      expect(savelist.generate).to_not be_nil
    end
    it 'creates a csv file with the content of @suppliers' do
      expect('../spec/aluminum_suppliers.csv').to exist
    end
  end
end
