class Member < ActiveRecord::Base
  has_friendship
  has_many :site_headings, dependent: :destroy
  after_save :create_member_site_headings, if: ->(member){ member.website.present? and member.website_changed? }

  def create_member_site_headings
    site_headings_hash = WebScraper.new(website).scrape_site_headings.site_headings
    site_headings_hash.each do |heading_type, heading_content_array|
      heading_content_array.each do |heading_content|
        self.site_headings.create(:content => heading_content, :header_type => heading_type)
      end
    end
  end
end
