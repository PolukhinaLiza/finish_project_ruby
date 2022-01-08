require "test_helper"
require 'faker'


class IntegrationTest < ActionDispatch::IntegrationTest

       test '1' do
          assert true
        end

      test 'unauthorized user will be redirected to login page' do
          # заходить на страницу пользователи, но его перенаправляет на вход
          get root_path
          assert_redirected_to new_session_path
        end

      test 'user with incorrect credentials will be redirected to login page' do
        # при входе с некорректными данными пользователя перенаправляет снова на страницу входа
        post session_path, params: { email: Faker::Internet.email, password: Faker::Lorem.word }
        assert_redirected_to new_session_path
      end

      test "user with correct credentials can see other users, their posts, write comments" do 
        # create credentials for user_1
        email_1 = Faker::Internet.email
        pass_1 = Faker::Lorem.word
        name_1 = Faker::Lorem.word
    
        # sign up 1
        # создания пользователя 1 и добавление ему поста
        user_1 = User.create(name: name_1, email: email_1, password: pass_1)
        question_1 = user_1.questions.build(title: 'title', body: 'body')

        assert question_1.save

        # create credentials for user_2
        email_2 = Faker::Internet.email
        pass_2 = Faker::Lorem.word
        name_2 = Faker::Lorem.word

        # sign up 2
        # регстрация пользователя 2 через форму регистрации
        post users_url, params: { user: { name: name_2, email: email_2, password: pass_2 } }
        assert_response :redirect

        # log in
        #вход 2 пользователя
        post session_path, params: { email: email_2, password: pass_2 }
        assert_response :redirect
        

         answer_1 = question_1.answers.build(body: 'body')
         assert_equal false, answer_1.save

         # with russian language
         get root_url, params: { locale: 'ru' }
         assert_response :success
     
         # with english language
         get root_url, params: { locale: 'en' }
         assert_response :success
         
      end 

        
end