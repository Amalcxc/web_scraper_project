require_relative '../lib/logic'

scraper = Scraper.new
scraper.scrapering
puts 'the movies with the release date'

title = scraper.movies
types = scraper.movies_quality
date = scraper.movies_date

types.each_with_index do |element, index|
  scraper.new_quality << index if element == 'Movie'
end
scraper.new_quality.each do |index|
  puts "- - - index: #{index + 1} - - -"
  puts "title: #{title[index]} | types: #{types[index]} | date: #{date[index][0..4]}"
end
