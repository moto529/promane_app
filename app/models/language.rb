class Language < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy
  validates :language, presence: true, uniqueness: true, length: {minimum:2, maximum:15}
end
