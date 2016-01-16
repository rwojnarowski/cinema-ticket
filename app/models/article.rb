class Article < ActiveRecord::Base

  belongs_to :user
  validates :title, presence: true, length: { minimum: 4, maximum: 20 }
  validates :description, presence: true, length: { minimum: 5, maximum: 500 }
  validates :user_id, presence: true
end
