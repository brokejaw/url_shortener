class DropShortUrlsTable < ActiveRecord::Migration
  def change
    drop_table :short_urls
  end
end
