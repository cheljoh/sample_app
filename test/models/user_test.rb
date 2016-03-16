require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Chelsea Waa", email: "chi@yahoo.com", password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = " "
    refute @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    refute @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    refute @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.com A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |address|
      @user.email = address
      assert @user.valid?, "#{address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    valid_addresses = %w[user@example,com user_at_foo.com user.name@example. foo@bar_baz.com foo@bar+baz.com]
    valid_addresses.each do |address|
      @user.email = address
      refute @user.valid?, "#{address.inspect} should be valid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup #dup makes a duplicate user
    duplicate_user.email = @user.email.upcase
    @user.save
    refute duplicate_user.valid?
  end

  test "password should  be present" do
    @user.password = @user.password_confirmation = " " * 6
    refute @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    refute @user.valid?
  end

end
