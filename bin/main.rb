require 'nokogiri'
require 'open-uri'


def scapering
  url = "https://www3.bflix.to/home"
  html = open("#{url}").read
  nokogiri_doc = Nokogiri::HTML(html)
  movie_listings = nokogiri_doc.css('div.item')
  movies = []

  movie_listings.each do |movie_listing|
    movie = {
      title: movie_listing.css('.info h3').text,
      date: movie_listing.css('.info span').text,
      url: "https://www3.bflix.to" + movie_listing.css('a')[0].attributes["href"].value
    }
    movies << movie
      
  end
  puts movies
  puts movies.count
end

scapering

