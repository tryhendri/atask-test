class Stock < ApplicationRecord
  has_one :wallet, as: :ownership
end
