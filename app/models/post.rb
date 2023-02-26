class Post < ApplicationRecord
    belongs_to :user

    has_many_attached :image
    validates :image, presence: true
    validates :content, presence: true
    mount_uploader :image, ImageUploader
    has_many :comments
    has_many :reactions
end
