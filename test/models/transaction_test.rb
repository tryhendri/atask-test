require "test_helper"

class TransactionTest < ActiveSupport::TestCase
  setup do
    user  = User.create(name: 'testing-user', email: 'test2@example.com', password: 'password2')
    team  = Team.create(name: 'testing-team')
    @wallet1 = Wallet.create!(ownership: user, balance: 1000)
    @wallet2 = Wallet.create!(ownership: team, balance: 500)
  end

  test 'valid transaction' do
    transaction = Transaction.new(source_wallet: @wallet1, target_wallet: @wallet2, amount: 100)
    assert transaction.save
  end

  test 'invalid transaction without source wallet' do
    transaction = Transaction.new(target_wallet: @wallet2, amount: 100)
    assert_not transaction.save
    assert transaction.errors[:source_wallet].any?
  end

  test 'invalid transaction without target wallet' do
    transaction = Transaction.new(source_wallet: @wallet1, amount: 100)
    assert_not transaction.save
    assert transaction.errors[:target_wallet].any?
  end

end
