require_relative '../lib/logic'

scrapar = Scrapar.new
scrapar.scraparing
puts 'the movies with the release date'

title = scrapar.movies
types = scrapar.movies_quality
date = scrapar.movies_date

types.each_with_index do |element, index|
  scrapar.new_quality << index if element == 'Movie'
end
scrapar.new_quality.each do |index|
  puts "- - - index: #{index + 1} - - -"
  puts "title: #{title[index]} | types: #{types[index]} | date: #{date[index][0..4]}"
end
