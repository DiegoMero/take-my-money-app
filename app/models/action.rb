class Action < ApplicationRecord
  has_many :action_groups
  belongs_to :user
end