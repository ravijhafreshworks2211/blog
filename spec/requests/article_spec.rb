require 'rails_helper'

RSpec.describe Article, type: :request do
  describe "GET index" do
    it "renders the index template" do
      get '/'
      expect(response).to render_template("index")
    end

    it 'assigns a new article' do
      get '/articles/new/'
      expect(assigns[:article]).to be_a(Article)
    end

    it 'renders the new article template' do
      get '/articles/new/'
      expect(response).to render_template 'articles/new'
    end

    it "redirects to public article page" do
      expect(post:'/articles',article:{ title: "Rspec Article", body: "This is very bad rspec article",status:'public' }).to change(Article,:count).by(1)
    end

  end

  
end
