require 'nokogiri'
require 'open-uri'

def scapering
  url = "https://www3.bflix.to/home"
  html = open("#{url}").read
  nokogiri_doc = Nokogiri::HTML(html)
  final_array = []

  nokogiri_doc.search(".info h3").each do |element| 
    element = element.text
    final_array << element
  end 

  final_array.each_with_index do |element, index|
    puts "#{index + 1} - #{element}"
  end
end

scapering
