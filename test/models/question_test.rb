require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  test 'create question' do
    # We can create one post and save them
    param = { head: 'sss', body: 'sss' }
    user_1=User.create(name: 'kkk', email: 'a@mail.ru', password: '222')
    question_1 = user_1.questions.build(title: 'title', body: 'body')
    assert_equal true, question_1.save

  end
end
