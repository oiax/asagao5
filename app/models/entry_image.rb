class EntryImage < ApplicationRecord
  belongs_to :entry
  has_one_attached :data
end
