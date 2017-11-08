class Comment < ApplicationRecord
  belongs_to :participant
  belongs_to :task
end
