require_relative '../lib/logic'

scraper = Scraper.new
scraper.scrapering


title = scraper.movies
types = scraper.movies_quality
date = scraper.movies_date

types.each_with_index do |element, index|
  scraper.new_quality << index if element == 'TV'
end
scraper.new_quality.each do |index|
  puts "- - - index: #{index + 1} - - -"
  puts "title: #{title[index]} | types: #{types[index]} | date: #{date[index][0..4]}"
end

# puts "choose a movie type"
# input = gets.chomp

# types.each_with_index do |element, index|
#   scraper.new_quality << index if element == input
# end
# scraper.new_quality.each do |index|
#   puts "- - - index: #{index + 1} - - -"
#   puts "title: #{title[index]} | types: #{types[index]} | date: #{date[index][0..4]}"
# end

