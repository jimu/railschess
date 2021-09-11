class User < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :games, through: :players

  validates :name, presence: true, uniqueness: true
  has_secure_password
end
