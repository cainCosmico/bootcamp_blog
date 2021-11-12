require 'rails_helper'

RSpec.describe Article, type: :model do
  subject do 
    user = create :user    
    described_class.new(
      title: "Test title!", 
      body: "This is a test description", 
      status: "public", 
      user_id: 1 
    )
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  context 'valid without param' do
    it "is not valid without a title" do
      subject.title = nil
      expect(subject).to_not be_valid
    end
  
    it "is not valid without a body" do
      subject.body = nil
      expect(subject).to_not be_valid
    end
  
    it "is not valid without a status" do
      subject.status = nil
      expect(subject).to_not be_valid
    end
  end

  context 'validations of presence' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }        
  end

  context 'associations' do
    it { should belong_to(:user).without_validating_presence }
    it { should have_many(:comments) }
  end

  context 'module visible' do
    it 'return false when status public' do
      expect(subject.archived?).to eq(false)
    end
    
    it 'return true when status archived' do
      subject.status = 'archived'
      expect(subject.archived?).to eq(true)
    end
  end
end