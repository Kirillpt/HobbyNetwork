class Category < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :posts, dependent: :destroy

  before_create { self.slug = SecureRandom.hex(6) }
end
