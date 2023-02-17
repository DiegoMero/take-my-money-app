class Group < ApplicationRecord
  has_and_belongs_to_many :actions
  belongs_to :user
end