require 'rails_helper'

RSpec.describe Msg, type: :model do
  it { should belong_to :contact}
  it { should validate_presence_of :body }
end
