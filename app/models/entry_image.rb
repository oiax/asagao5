class EntryImage < ApplicationRecord
  belongs_to :entry
  has_one_attached :data

  validate do
    if data.attached?
      unless data.content_type.in?(ALLOWED_CONTENT_TYPES)
        errors.add(:data, :invalid_image_type)
      end
    else
      errors.add(:data, :empty)
    end
  end
end
