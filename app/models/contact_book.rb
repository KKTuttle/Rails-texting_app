class ContactBook < ApplicationRecord
  belongs_to :user
  has_many :contacts
  validates :name, presence: true
end
