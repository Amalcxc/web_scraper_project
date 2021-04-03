require_relative '../lib/logic'

scraper = Scraper.new
scraper.scrapering

title = scraper.movies
types = scraper.movies_quality
date = scraper.movies_date

puts 'choose a movie/Show name'
input = gets.chomp.downcase

title.each_with_index do |element, index|
  scraper.new_title << index if element.include?(input)
end
puts 'no movie with that name' if scraper.new_title.empty?

scraper.new_title.each do |index|
  puts "- - - index: #{index + 1} - - -"
  puts "title: #{title[index]} | types: #{types[index]} | date/season: #{date[index][0..4]}"
end
