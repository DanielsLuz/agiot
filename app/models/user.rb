class User < ApplicationRecord
  validates :name, presence: true
  has_one :loan
end
