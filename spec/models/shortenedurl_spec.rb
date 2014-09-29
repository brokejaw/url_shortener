require 'rails_helper'

describe ShortenedUrl do
  it "has a valid factory" do
    FactoryGirl.create(:shortened_url).should be_valid
  end
  
  it "is invalid without an input url" do
    FactoryGirl.build(:shortened_url, long_url: nil).should_not be_valid
  end
  
  it "is invalid with an invalid url input" do
    FactoryGirl.build(:shortened_url, long_url: "www.google.com").should_not be_valid
  end
  
  context "when input is valid" do
    ShortenedUrl.create!(long_url: "http://www.google.com")
    
    it "saves new model to the db" do
      expect(ShortenedUrl.first.long_url).to eq("http://www.google.com")
    end
    
    it "generates a short_url" do
      expect(ShortenedUrl.first.short_url).to_not be_nil
    end
  end
end