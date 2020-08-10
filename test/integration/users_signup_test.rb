require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'valid signup information' do
    get new_user_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: 'Example User',
                                         email: 'user@example.com',
                                         password: 'password',
                                         password_confirmation: 'password' } }
    end
  end
end