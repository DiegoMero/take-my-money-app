class Group < ApplicationRecord
  has_and_belongs_to_many :investments
  belongs_to :author, class_name: 'User'

  validates :name, :icon, presence: true
end
