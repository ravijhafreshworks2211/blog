class Article < ApplicationRecord
    include Visible
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    has_many :comments
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }

    settings do
        mappings dynamic: false do
          indexes :title, type: :text, analyzer: :english
          indexes :body, type: :text, analyzer: :english
        end
    end

    def self.search_published(query)
        self.search({
          query: {
            bool: {
              must: [
              {
                multi_match: {
                  query: query,
                  fields: [:title, :body]
                }
              },
              {
                match: {
                  status:'public'
                }
              }]
            }
          }
        })
      end
  
end
