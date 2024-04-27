class Post < ApplicationRecord
    belongs_to :user
    # has_many :post_images, dependent: :destroy
    has_many_attached :images
    validates :images, presence: true
    validates :title, presence: true
    # mount_uploader :image, ImageUploader
    has_many :comments
    has_many :reactions


    default_scope -> { order(title: :asc) }
    # column :title, :string, null: false
    # scope :order_by_title, -> { order(title: :asc) }
    # has_one_attached :attached

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
