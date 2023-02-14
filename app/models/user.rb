class User < ApplicationRecord
  has_many :actions
  has_many :groups
end