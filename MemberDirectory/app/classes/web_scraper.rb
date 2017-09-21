class WebScraper
  require 'open-uri'
  attr_accessor :site_url, :site_headings

  def initialize(site_url)
    @site_url = site_url
    @site_headings = {:h1 => [], :h2 => [], :h3 => []}
  end

  def scrape_site_headings
    doc = Nokogiri::HTML(open(site_url).read)
    site_headings[:h1] = doc.css('h1').children.map {|child| child.text}
    site_headings[:h2] = doc.css('h2').children.map {|child| child.text}
    site_headings[:h3] = doc.css('h3').children.map {|child| child.text}
  end
end