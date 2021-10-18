require "test_helper"

class CommentTest < ActiveSupport::TestCase
  
  test "comment is invalid without body" do
    comment = Comment.new
    assert !comment.valid?
  end

  test "comment is invalid without article" do
    comment = Comment.new(body:"Comment")
    assert !comment.valid?
  end

  test "shoudld save comment with article" do
    article = Article.new(title:"AR1",body:"new article body")
    comment = Comment.new(article:article,body:"this is very good article")
    assert comment.save
  end
  


end
