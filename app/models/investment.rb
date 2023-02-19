class Investment < ApplicationRecord
  has_and_belongs_to_many :groups
  belongs_to :author, class_name: 'User'

  validates :name, :amount, :groups, presence: true
end
