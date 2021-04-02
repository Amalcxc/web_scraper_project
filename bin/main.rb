require_relative '../lib/logic'

scraper = Scraper.new
scraper.scrapering


title = scraper.movies
types = scraper.movies_quality
date = scraper.movies_date

#get movie titles 
puts "choose a movie name"
input = gets.chomp

title.each_with_index do |element, index|
  scraper.new_title << index if element == input
end
scraper.new_title.each do |index|
  puts "- - - index: #{index + 1} - - -"
  puts "title: #{title[index]} | types: #{types[index]} | date: #{date[index][0..4]}"
end
