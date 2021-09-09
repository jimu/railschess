class User < ApplicationRecord
  has_many :players, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  has_secure_password
end
