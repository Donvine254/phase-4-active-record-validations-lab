class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 250 }
  validates :summary, presence: true, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }
  validate :click_baity

  def click_baity
    clickbait_words = ["Won't Believe", 'Secret', 'Top [number]', 'Guess']
    
    if title.nil? || !clickbait_words.any? { |word| title.include?(word) }
      errors.add(:title, 'not clickbait-y enough!')
    end
  end
  
end
