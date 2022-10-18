class Language < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy
  validates :language, presence: true, uniqueness: { scope: :user_id }, length: { minimum: 2, maximum: 15 }
end
