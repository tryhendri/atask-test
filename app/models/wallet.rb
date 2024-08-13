class Wallet < ApplicationRecord
  belongs_to :ownership, polymorphic: true
  has_many :transactions, foreign_key: :source_wallet_id
  has_many :incoming_transactions, class_name: 'Transaction', foreign_key: :target_wallet_id
end
