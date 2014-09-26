require 'rails_helper'

describe ShortenedUrl do
  it "saves new model to the db" do
    ShortenedUrl.create!(long_url: "http://www.google.com")

    expect(ShortenedUrl.first.long_url).to eq("http://www.google.com")
    expect(ShortenedUrl.first.long_url).to_not eq("bananarama")
  end
end