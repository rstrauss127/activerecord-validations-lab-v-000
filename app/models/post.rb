class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {range: 15..100}
end
