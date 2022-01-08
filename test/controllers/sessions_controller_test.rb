# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  # setup do
  #   @user = User.create(name: 'li', email: 'li@mail.ru', password: '21', password_confirmation: '21')
  #   post create_session_url, params: { name: 'li',email: 'li@mail.ru', password: '21' }
  # end

  # test 'new' do
  #   # get page
  #   get new_session_url
  #   assert_response :success
  # end
  
  # test 'create' do
  #   # create session (new)
  #   post create_session_url, params: { name: 'li',email: 'abcd@mail.ru', password: '21' }
  #   assert_redirected_to root_url
  # end

  # test 'destroy' do
  #   # can logout from session
  #   get session_destroy_url
  #   assert_redirected_to new_session_url
  # end
end

