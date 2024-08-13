require "test_helper"

class StockTest < ActiveSupport::TestCase
  test 'should create a stock with a wallet' do
    stock = Stock.create!(name: 'Apple', symbol: 'AAPL', industry: 'Technology')
    assert_not_nil stock.symbol
  end 
end
