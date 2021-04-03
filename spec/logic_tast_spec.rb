require_relative '../lib/logic'

describe Scraper do
  let(:film) { Scraper.new }
  let(:films) { film.scrapering }
  describe '#scrapering' do
    it 'return false if the array is not empty' do
      expect(films.empty?).to eql(false)
    end
  end
end
