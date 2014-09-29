FactoryGirl.define do
  factory :shortened_url do |f|
    f.long_url "http://www.google.com"
  end
  factory :invalid_sub, class: ShortenedUrl do |f|
    f.long_url ""
  end
end

