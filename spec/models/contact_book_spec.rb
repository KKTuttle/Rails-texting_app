require 'rails_helper'

RSpec.describe ContactBook, type: :model do
  it { should belong_to :user }
  it { should have_many :contacts }
  it { should validate_presence_of :name}
end
