class WebScraper
  require 'open-uri'
  attr_accessor :site_url, :site_headings

  def initialize(site_url)
    @site_url = site_url
    @site_headings = {:h1 => [], :h2 => [], :h3 => []}
  end

  def scrape_site_headings
    doc = Nokogiri::HTML(open(site_url).read)
    ['h1', 'h2', 'h3'].each do |header_type|
      site_headings[header_type.to_sym] = doc.css(header_type).children.map {|child| child.text.gsub(/[^0-9a-z ]/i, '')}
    end
    self
  end
end