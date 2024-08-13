require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: 'test@example.com', password: 'password')
  end

  test 'valid user' do
    assert @user.valid?
  end


  test 'should encrypt password' do
    @user.save
    assert_not_equal @user.password, @user.password_hash
  end

  test 'should authenticate user' do
    @user.save
    authenticated_user = User.authenticate(email: @user.email, password: @user.password)
    assert_equal @user, authenticated_user
  end

  test 'should return nil for invalid credentials' do
    authenticated_user = User.authenticate(email: 'invalid@example.com', password: 'wrong_password')
    assert_nil authenticated_user
  end
end
