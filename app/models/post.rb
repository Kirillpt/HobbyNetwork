class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  before_create { self.slug = SecureRandom.hex(6) }
end
