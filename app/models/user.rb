class User < ApplicationRecord
  validates :name, :email, :address, presence: true
  validates :email, uniqueness: true
end
