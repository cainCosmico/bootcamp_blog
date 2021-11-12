require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do     
    user = create :user
    article = create :article

    described_class.new(
      commenter: "John Doeh",
      body: "This is a test comment",
      status: 'public',
      article_id: 1    
    )
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  context 'valid without param' do
    it "is not valid without a title" do
      subject.commenter = nil
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
    it { should validate_presence_of(:commenter) }
    it { should validate_presence_of(:body) }        
  end

  context 'associations' do
    it { should belong_to(:article).without_validating_presence }
  end
end
