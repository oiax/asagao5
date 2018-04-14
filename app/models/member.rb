class Member < ActiveRecord::Base
  has_secure_password

  has_many :entries, dependent: :destroy
  has_one_attached :profile_picture

  validates :number, presence: true,
    numericality: { only_integer: true,
      greater_than: 0, less_than: 100, allow_blank: true },
    uniqueness: true
  validates :name, presence: true,
    format: { with: /\A[A-Za-z]\w*\z/, allow_blank: true },
    length: { minimum: 2, maximum: 20, allow_blank: true },
    uniqueness: { case_sensitive: false }
  validates :full_name, length: { maximum: 20 }

  ALLOWED_CONTENT_TYPES = %q{
    image/jpeg
    image/png
    image/gif
    image/bmp
  }

  validate do
    return unless profile_picture.attached?

    unless profile_picture.content_type.in?(ALLOWED_CONTENT_TYPES)
      errors.add(:profile_picture, :invalid_image_type)
    end
  end

  class << self
    def search(query)
      rel = order("number")
      if query.present?
        rel = rel.where("name LIKE ? OR full_name LIKE ?",
          "%#{query}%", "%#{query}%")
      end
      rel
    end
  end
end
