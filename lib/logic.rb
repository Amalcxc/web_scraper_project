require 'nokogiri'
require 'open-uri'

class Scrapar
  attr_accessor :nokogiri_doc, :movies, :movies_quality, :movies_date, :new_quality
  
  def initialize
    url = "https://www3.bflix.to/home"
    html = open("#{url}").read
    @nokogiri_doc = Nokogiri::HTML(html)
    @movies = []
    @movies_quality = []
    @movies_date = []
    @new_quality = []
  end 

  def scraparing
    movie_listings = @nokogiri_doc.css('div.item')
    movie_listings.each do |movie_listing|
      movie_title = {
        title: movie_listing.css('.info h3').text,
      }
      movie_date = {
        date: movie_listing.css('.info span').text
      }
      movie_quality = {
        quality: movie_listing.css('.type').text
      }

      @movies << movie_title[:title]
      @movies_date << movie_date[:date]
      @movies_quality << movie_quality[:quality]
    end
  end
 
end