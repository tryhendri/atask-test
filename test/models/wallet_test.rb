require "test_helper"

class WalletTest < ActiveSupport::TestCase
  setup do
    @user = User.first
    @wallet = Wallet.create!(ownership: @user, balance: 1000)
  end

  test 'should create a wallet with an owner' do
    assert_equal @user, @wallet.ownership
  end

end
