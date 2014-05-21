class User < ActiveRecord::Base
  #validates :name, presence: true, uniqueness: true,
  has_secure_password
  has_many :reservations, dependent: :destroy
  has_many :books, through: :reservations
end
