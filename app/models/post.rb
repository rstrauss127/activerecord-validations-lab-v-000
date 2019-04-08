class MyValidator < ActiveModel::Validator
  def validate(post)
    if post.title.include? "Won't Believe"
      return true
    elsif post.title.include? "Secret"
      return true
    elsif post.title.include? "Guess"
      return true
    else 
      return false
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
end
