class ShortenedUrl < ActiveRecord::Base
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true
  
  before_validation :generate_short_url
  
  def generate_short_url
    self.short_url = ShortenedUrl.random_code
  end
  
  def self.random_code
    loop do
      random_code = SecureRandom.urlsafe_base64(16)
      return random_code unless ShortenedUrl.exists?(short_url: random_code)
    end
  end
end