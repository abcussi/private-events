require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_user_path
    assert_response :success
  end

  test 'should get show' do
    @user = User.create(name: 'name', email: 'email',
                        password: 'password', password_confirmation: 'password')
    get user_path(@user)
    assert_response :success
  end
end
