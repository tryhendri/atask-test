# lib/stock_price/latest_stock_price.rb

require 'uri'
require 'net/http'
require 'json'

module StockPrice
  class LatestStockPrice
    API_URL = 'https://latest-stock-price.p.rapidapi.com/any'
    API_KEY = ENV['RAPID_API_LATEST_STOCK_KEY']

    def initialize(api_key = nil)
      @api_key = api_key || API_KEY
    end

    def price_all
      response = get_data(API_URL)
      raise "Failed to retrieve data: #{response.code}" unless response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body)
    end

    private

    def get_data(url)
      uri = URI(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(uri.request_uri)
      request['x-rapidapi-key'] = @api_key
      request['x-rapidapi-host'] = 'latest-stock-price.p.rapidapi.com'

      http.request(request)
    end
  end
end

