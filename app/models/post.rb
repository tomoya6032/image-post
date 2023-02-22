class Post < ApplicationRecord
    belongs_to :user

    has_many_attached :image
    validates :image, presence: true
    validates :content, presence: true
    has_many :comments
    has_many :reactions
end
