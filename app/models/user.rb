class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true

  has_many :schedule_users
  has_many :schedules, through: :schedule_users
  accepts_nested_attributes_for :schedule_users

  enum membership: { associate: 0, regular: 1, admin: 9 }
end
