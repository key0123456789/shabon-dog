class Schedule < ApplicationRecord
  has_many :schedule_users, dependent: :destroy
  has_many :users, through: :schedule_users
end
