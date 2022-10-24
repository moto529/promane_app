class Language < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy
  validates :language, presence: true, uniqueness: { scope: :user_id }, length: { maximum: 15 }
end
