class TransactionService
  def initialize(source_wallet, target_wallet, amount)
    @source_wallet = source_wallet
    @target_wallet = target_wallet
    @amount = amount
  end

  def create_transaction
    ActiveRecord::Base.transaction do
      raise 'Insufficient funds' if @source_wallet.balance < @amount

      @source_wallet.update!(balance: @source_wallet.balance - @amount)
      @target_wallet.update!(balance: @target_wallet.balance + @amount)

      Transaction.create!(
        source_wallet: @source_wallet,
        target_wallet: @target_wallet,
        amount: @amount
      )
    end
  rescue ActiveRecord::RecordNotFound, ActiveRecord::RecordInvalid, 'Insufficient funds' => e
    raise e
  end
end