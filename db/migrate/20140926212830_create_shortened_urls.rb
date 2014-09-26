class CreateShortenedUrls < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
      t.string "short_url", null: false
      t.string "long_url",  null: false
    end
    add_index "shortened_urls", "short_url"
  end
end
