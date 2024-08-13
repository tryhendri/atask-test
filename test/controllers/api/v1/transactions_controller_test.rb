require "test_helper"

class Api::V1::TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user1 = User.first
    @team1  = Team.create(name: 'testing-team')

    @user1_wallet = Wallet.create!(ownership: @user1, balance: 1000)
    @team1_wallet = Wallet.create!(ownership: @team1, balance: 500)
  end

  test 'should create a transaction with valid data' do
    post api_v1_transactions_url, params: {
      source_wallet_id: @user1_wallet.id,
      target_wallet_id: @team1_wallet.id,
      amount: 100
    }

    assert_response :created
    transaction_response = JSON.parse(response.body)
    # Add further assertions on specific transaction attributes here
  end

end
