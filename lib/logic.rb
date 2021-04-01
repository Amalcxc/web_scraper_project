require 'nokogiri'
require 'open-uri'

class Scrapar
  attr_accessor :nokogiri_doc, :movies_title, :movies_quality, :movies_date, :new_quality
  
  def initialize
    url = "https://www3.bflix.to/home"
    html = open("#{url}").read
    @nokogiri_doc = Nokogiri::HTML(html)
  end 

  def scaparing
    movie_listings = @nokogiri_doc.css('div.item')
    @movies = []
    @movies_quality = []
    @movies_date = []
    @new_quality = []
    movie_listings.each do |movie_listing|
      movie_title = {
        title: movie_listing.css('.info h3').text,
      }
      movie_date = {
        date: movie_listing.css('.info span').text
      }
      movie_quality = {
        quality: movie_listing.css('.quality').text
      }

     
      
      @movies << movie_title[:title]
      @movies_date << movie_date[:date]
      @movies_quality << movie_quality[:quality]
 
    end

    title = @movies
    types = @movies_quality
    date = @movies_date

    
    types.each_with_index do |element, index|
      if element == "CAM"
        @new_quality << index  
      end
    end
    @new_quality.each do |index|
      puts "- - - index: #{index + 1} - - -"
      puts "title: #{title[index]} | types: #{types[index]} | date: #{date[index][0..4]}"
    end   
  
  end
 
end