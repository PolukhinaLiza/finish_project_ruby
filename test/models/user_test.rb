require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'users with the same username' do
    # create user with  email a@mail.ru
    user = User.new(name: 'kkk', email: 'a@mail.ru', password: '222')
    assert_equal true, user.save

    user1 = User.new(name: 'kkk', email: 'a@mail.ru', password: '222')
    # tried to save one more user with email a@mail.ru
    assert_equal false, user1.save
  end
end
