require 'rails_helper'

RSpec.describe Article, type: :model do
  
  context "validations tests" do
    it "ensures the title is present" do
      article = Article.new(body: "Content of the body")
      expect(article.valid?).to eq(false)
    end

    it "ensures the body is present" do
      article = Article.new(title: "Title")
      expect(article.valid?).to eq(false)
    end

    it "ensures the article is not public by default" do
      article = Article.new(body: "Content of the body", title: "Title")
      expect(article.status).to eq(nil)
    end

    it "should be able to save article" do
      article = Article.new(body: "Content of the body", title: "Title",status:'public')
      expect(article.save).to eq(true)
    end
  end

  context "scopes tests" do
    let(:params) { { body: "Content of the body", title: "Title", status: 'public' } }
    before(:each) do
      Article.create(params)
      Article.create(params)
      Article.create(params)
      Article.create(params.merge(status: 'private'))
      Article.create(params.merge(status: 'private'))
    end

    it "should return all active articles" do
      expect(Article.where(status:'public').count).to eq(3)
    end

    it "should return all inactive articles" do
      expect(Article.where(status:'private').count).to eq(2)
    end
  end

end
