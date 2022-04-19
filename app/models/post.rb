class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :title, presence: true
  validates :body, presence: true
  validates :title, length: {maximum: 50}
  before_create { self.slug = SecureRandom.hex(6) }


  def self.search(search)
    where("body LIKE ?", "%#{search}%")
  end
end
