class Contact < ApplicationRecord
  belongs_to :contact_book
  validates :name, presence: true
  validates :phone, presence: true

end
