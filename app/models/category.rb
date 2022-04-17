class Category < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :posts, dependent: :destroy
  validates :title, presence: true
  before_create { self.slug = SecureRandom.hex(6) }

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end
end
