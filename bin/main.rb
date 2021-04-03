require_relative '../lib/logic'

scraper = Scraper.new
scraper.scrapering

title = scraper.movies
types = scraper.movies_quality
date = scraper.movies_date

puts title[0..11]

puts 'Use Quit To Stop The Loop'

while scraper.scrapering
  puts 'Choose A Movie/Show Name:'
  input = gets.chomp.downcase
  scraper.new_title = []
  break if input == 'quit'

  title.each_with_index do |element, index|
    scraper.new_title << index if element.include?(input)
  end

  puts 'No Movie with That Name' if scraper.new_title.empty?

  scraper.new_title.each do |index|
    puts "- - - index: #{index + 1} - - -"
    puts "title: #{title[index]} | types: #{types[index]} | date/season: #{date[index][0..4]}"
  end
end
