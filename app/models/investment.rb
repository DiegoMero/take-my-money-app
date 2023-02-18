class Investment < ApplicationRecord
  has_and_belongs_to_many :groups
  belongs_to :user

  validates :name, :amount, :groups, presence: true
end
