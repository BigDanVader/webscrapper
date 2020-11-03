require 'nokogiri'
require 'httparty'


def scraper
  url = 'http://books.toscrape.com/index.html'
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  book_listings = parsed_page.css('article.product_pod')
  book_listings.each do |book_listing|
    book = {
        title: book_listing.css('h3').text,
        price: book_listing.css('p.price_color').text
    }
    puts book
  end


end

scraper


