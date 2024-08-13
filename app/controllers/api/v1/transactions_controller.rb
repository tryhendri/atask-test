class Api::V1::TransactionsController < ApplicationController
  def create
    source_wallet = Wallet.find(params[:source_wallet_id])
    target_wallet = Wallet.find(params[:target_wallet_id])
    amount = BigDecimal(params[:amount]) rescue nil

    service = TransactionService.new(source_wallet, target_wallet, amount)
    transaction = service.create_transaction

    render json: transaction, status: :created
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
end
