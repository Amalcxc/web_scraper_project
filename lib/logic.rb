require 'nokogiri'
require 'httparty'

# this class spcraper information the movie side
class Scraper
  attr_accessor :nokogiri_doc, :movies, :movies_quality, :movies_date, :new_quality, :new_title

  def initialize
    url = 'https://www3.bflix.to/home'
    html = HTTParty.get(url)
    @nokogiri_doc = Nokogiri::HTML(html)
    @movies = []
    @movies_quality = []
    @movies_date = []
    @new_quality = []
    @new_title = []
    @new_date = []
  end

  def scrapering
    movie_listings = @nokogiri_doc.css('div.item')
    movie_listings.each do |movie_listing|
      movie = {
        title: movie_listing.css('.info h3').text,
        date: movie_listing.css('.info span').text,
        quality: movie_listing.css('.type').text
      }

      @movies << movie[:title]
      @movies_date << movie[:date]
      @movies_quality << movie[:quality]
    end
  end
end
