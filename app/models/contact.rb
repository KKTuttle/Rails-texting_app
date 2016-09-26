class Contact < ApplicationRecord
  belongs_to :contact_book
  has_many :msgs
  validates :name, presence: true
  validates :phone, presence: true

end
