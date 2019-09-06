require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  test "title validation should trigger" do
    assert_not Question.new(answer: 'Hello').save
  end

  test "answer validation should trigger" do
    assert_not Question.new(title: 'Hello').save
  end

  test "title and answer validation should trigger" do
    assert_not Question.new().save
  end
end
