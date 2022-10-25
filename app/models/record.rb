class Record < ApplicationRecord
  belongs_to :language
  has_one :user, through: :language
  validates :detail, presence: true, length: { maximum: 250 }
  validates :time, presence: true, numericality: true
end
