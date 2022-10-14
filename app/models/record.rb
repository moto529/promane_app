class Record < ApplicationRecord
  belongs_to :language
  validates :detail, presence: true, length: {minimum:1, maximum:250}
  validates :time, presence: true, numericality: true
end
