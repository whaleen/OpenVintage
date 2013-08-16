require 'spec_helper'

describe "Bottles pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "bottlesst creation" do
    before { visit root_path }
    
    describe "with invalid information" do
      
      it "should not create a bottlesst" do
        expect { click_button "Post" }.not_to change(Bottle, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before { fill_in 'bottlesst_content', with: "Lorem ipsum" }
      it "should create a bottlesst" do
        expect { click_button "Post" }.to change(Bottle, :count).by(1)
      end
    end
  end

  describe "bottlesst destruction" do
    before { FactoryGirl.create(:bottlesst, user: user) }
    
    describe "as correct user" do
      before { visit root_path }
      
      it "should delete a bottlesst" do
        expect { click_link "delete" }.to change(Bottle, :count).by(-1)
      end
    end
  end
end