class PostImage < ApplicationRecord
  
  has_many :post_image_tag_relations, dependent: :destroy
  has_many :tags, through: :post_image_tag_relations, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  
  has_one_attached :image
  
  validates :introduction, length: { in: 1..100 }
  validates :title, length: { in: 3..20 }
  
  def get_image(width, height)
   unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
    image.variant(resize_to_fill: [width, height,]).processed
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
