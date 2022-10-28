class Record < ApplicationRecord
  belongs_to :language
  has_one :user, through: :language
  validates :detail, presence: true, length: { maximum: 250 }
  validates :learning_hours, inclusion: { in: [0, 60, 120, 180, 240, 300, 360, 420, 480, 540, 600] }
  validates :laerning_minutes, inclusion: { in: [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55] }


  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
end
