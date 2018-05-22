class EntryImage < ApplicationRecord
  belongs_to :entry
  has_one_attached :data
  acts_as_list scope: :entry

  attribute :new_data

  validate do
    if new_data
      if new_data.respond_to?(:content_type)
        unless new_data.content_type.in?(ALLOWED_CONTENT_TYPES)
          errors.add(:new_data, :invalid_image_type)
        end
      else
        errors.add(:new_data, :invalid)
      end
    else
      errors.add(:new_data, :empty)
    end
  end

  before_save do
    self.data = new_data if new_data
  end
end
