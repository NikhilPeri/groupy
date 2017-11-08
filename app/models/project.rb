class Project < ApplicationRecord
  belongs_to :account

  has_many :participants
  has_many :columns
end
