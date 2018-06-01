class Entry < ApplicationRecord
  belongs_to :author, class_name: "Member", foreign_key: "member_id"
  has_many :images, class_name: "EntryImage"

  STATUS_VALUES = %w(draft member_only public)

  validates :title, presence: true, length: { maximum: 200 }
  validates :body, :posted_at, presence: true
  validates :status, inclusion: { in: STATUS_VALUES }

  scope :common, -> { where(status: "public") }
  scope :published, -> { where("status <> ?", "draft") }
  scope :full, ->(member) {
    where("member_id = ? OR status <> ?", member.id, "draft") }
  scope :readable_for, ->(member) { member ? full(member) : common }

  class << self
    def status_text(status)
      I18n.t("activerecord.attributes.entry.status_#{status}")
    end

    def status_options
      STATUS_VALUES.map { |status| [status_text(status), status] }
    end
  end
end
