class User < ApplicationRecord
  validates :name, :email, :address, presence: true
  validates :email, uniqueness: true

  has_many :events, foreign_key: "host_id"
end
