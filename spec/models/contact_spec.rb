require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { should belong_to :contact_book }
  it { should validate_presence_of :name }
  it { should validate_presence_of :phone }
end
