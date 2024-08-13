class Team < ApplicationRecord
  has_one :wallet, as: :ownership
end
