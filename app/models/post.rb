class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :title, presence: true
  validates :body, presence: true
  before_create { self.slug = SecureRandom.hex(6) }

  def self.search(search)
    where("body LIKE ?", "%#{search}%")
  end
end
