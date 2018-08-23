class Blog < ApplicationRecord
  enum status: { draft: 0, published:1}
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body

  belongs_to :topic

  after_initialize :set_default

  def set_default
    self.topic_id ||= 1
  end
end
