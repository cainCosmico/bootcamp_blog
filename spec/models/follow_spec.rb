require 'rails_helper'

RSpec.describe Follow, type: :model do  
  subject do
    created_users = FactoryBot.build_list(:user, 2) do |user, i|
      user.email = "test#{i}@user.com"      
    end        

    described_class.new(follower: created_users[0], followed: created_users[1])
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  context 'valid without param' do 
    it "is not valid without a body" do
      subject.follower = nil
      expect(subject).to_not be_valid
    end
  
    it "is not valid without a status" do
      subject.followed = nil
      expect(subject).to_not be_valid
    end
  end

  context 'associations' do
    it { should belong_to(:follower).class_name('User') }
    it { should belong_to(:followed).class_name('User') }
  end
end
