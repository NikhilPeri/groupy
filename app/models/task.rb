class Task < ApplicationRecord
  belongs_to :participant
  belongs_to :column

  has_many :comments
end
