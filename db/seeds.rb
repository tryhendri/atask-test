# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require './app/services/transaction_service'

user  = User.create(name: 'testing-user', email: 'test1@example.com', password: 'password1')
team  = Team.create(name: 'testing-team')
stock =  Stock.create(name: 'testing-stock', symbol: 'TEST', industry: 'testing-industry')

user_wallet = Wallet.create!(ownership: user, balance: 1000)
team_wallet = Wallet.create!(ownership: team, balance: 2000)
stock_wallet = Wallet.create!(ownership: stock, balance: 1000)

# Create transactions
TransactionService.new(user_wallet, team_wallet, 200).create_transaction
TransactionService.new(stock_wallet, team_wallet, 100).create_transaction