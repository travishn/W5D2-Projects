# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get users_create_url
    assert_response :success
  end

  test "should get new" do
    get users_new_url
    assert_response :success
  end

end
