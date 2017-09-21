class Member < ActiveRecord::Base
  has_friendship
  has_many :site_headings
end
