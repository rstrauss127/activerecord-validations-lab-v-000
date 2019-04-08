class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

  @@terms = [/Won't Believe/, /Secret/, /Guess/, /Top \d*/]

  def clickbait
    if @@terms.none? {|term| term.match(title)}
      errors.add(:title, "not clicky enough")
    end
  end
end
