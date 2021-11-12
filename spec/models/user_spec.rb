require 'rails_helper'

RSpec.describe User, type: :model do

  subject do
    user = create :user
  end

  it "is valid with valid attributes" do
    expect(subject.valid_password?('qwerty')).to be_truthy
  end

  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
