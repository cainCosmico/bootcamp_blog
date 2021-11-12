require 'spec_helper'

class TestClase
  include Visible

  def initialize()
  end
end

RSpec.describe Visible, type: :module do  
  it 'archived?' do
    tc = TestClase.new
    p tc    
    # expect(subject).to eq(5)
  end
end