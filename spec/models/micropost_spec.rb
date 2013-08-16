require 'spec_helper'

describe Bottle do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    @bottle = Bottle.new(content: "Lorem ipsum", user_id: user.id)
  end
  
  subject { @bottle }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }

  describe "when user_id is not present" do
    before { @bottle.user_id = nil }
    it { should_not be_valid }
  end
  describe "when user_id is not present" do
    before { @bottle.user_id = nil }
    it { should_not be_valid }
  end
    
  describe "with blank content" do
    before { @bottle.content = " " }
    it { should_not be_valid }
  end
  
  describe "with content that is too long" do
    before { @bottle.content = "a" * 141 }
    it { should_not be_valid }
  end
end