require "test_helper"

class ArticleTest < ActiveSupport::TestCase

  test "should not save article without title" do
    article = Article.new
    assert_not article.save
  end

  test "should not save post without body" do
    article = Article.new(title:"hello")
    assert !article.save
  end

  test "should save article" do
    article  = Article.new(title:"New Article",body:"Hello this is my first article")
    assert article.save
  end

  test "should throw valdiation error for body text count less than 10" do
    article = Article.new(title:"HI",body:"body")
    assert !article.save
    assert !article.valid?
    assert_equal("Body is too short (minimum is 10 characters)",article.errors.objects.first.full_message)
  end

  
  
end
