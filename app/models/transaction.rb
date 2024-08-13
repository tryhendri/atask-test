class Transaction < ApplicationRecord
  belongs_to :source_wallet, class_name: 'Wallet'
  belongs_to :target_wallet, class_name: 'Wallet'
end
