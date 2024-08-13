require 'rake/task'
require 'stock_price/latest_stock_price'

namespace :stock_prices do
  desc "Fetch and process stock prices"
  task fetch: :environment do
    stock_price = StockPrice::LatestStockPrice.new(ENV['RAPID_API_LATEST_STOCK_KEY'])
    data = stock_price.price_all
    # Process the fetched stock prices here (e.g., store in database, send notifications)
    puts data
    puts "Fetched and processed stock prices"
  end
end
