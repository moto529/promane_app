class Record < ApplicationRecord
  belongs_to :language
  has_one :user, through: :language
  validates :detail, presence: true, length: { minimum: 1, maximum: 250 }
  validates :time, presence: true, numericality: true
end
