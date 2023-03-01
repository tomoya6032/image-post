class Post < ApplicationRecord
    belongs_to :user

    has_many_attached :images
    validates :images, presence: true
    validates :content, presence: true
    mount_uploader :image, ImageUploader
    has_many :comments
    has_many :reactions

    # def display_created_at
    #   I18n.l(self.created_at, format: :default)
    # end

    # def author_name
    #   user.display_name
    # end

    # def like_count
    #   likes.count
    # end

end
