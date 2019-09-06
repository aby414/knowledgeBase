require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  test "title validation should trigger" do
    assert_not Article.new(body: 'Hello').save
  end

  test "body validation should trigger" do
    assert_not Article.new(title: 'Hello').save
  end

  test "title and body validation should trigger" do
    assert_not Article.new().save
  end
end
