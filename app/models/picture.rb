class Picture < ApplicationRecord

  validates :artist, presence: true
  validates :title, length: {minimum: 3, maximum: 20}
  validates :url, presence: true, uniqueness: true

  def self.newest_first
    Picture.order("created_at DESC")
  end
  def self.most_recent_five
      Picture.newest_first.limit(5)
  end
  def self.created_before(time)
    Picture.where("created_at < ?", time)
  end
  def self.pictures_created_in_year(year)
    beginning_of_year = DateTime.new(year, 1, 1)
    end_of_year = DateTime.new(year, 12, 31)
    Picture.where("created_at > ? and created_at < ?", beginning_of_year, end_of_year)
  end

end
