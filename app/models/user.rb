class User < ApplicationRecord
  attr_accessor :password

  has_one :wallet, as: :ownership

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, on: :create

  before_save :encrypt_password

  def self.authenticate(authorization)
    user = find_by(email: authorization[:email])
    user && user.password_hash == Digest::SHA256.hexdigest(authorization[:password]) ? user : nil
  end

  private

  def encrypt_password
    self.password_hash = Digest::SHA256.hexdigest(password)
  end
end
