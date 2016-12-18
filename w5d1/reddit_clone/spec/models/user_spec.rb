require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) do
    FactoryGirl.build(:user,
    username: "bob",
    password: "iambob")
  end

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should have_many(:subs) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "#reset_session_token" do
    it "resets the session token and saves to the DB" do
      old_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).not_to eq(old_token)
    end
  end


  describe "#is_password?" do
    it "checks whether a given password is correct for a user" do
      expect(user.is_password?("iambob")).to be true
      expect(user.is_password?("youarebob")).to be false
    end
  end

  describe ".find_by_credentials" do
    before { user.save! }
    it "finds a user by username and password" do
      expect(User.find_by_credentials("bob", "iambob")).to eq(user)
    end

    it "returns nil if no matching user is found" do
      expect(User.find_by_credentials("bob", "iamnotbob")).to be_nil
      expect(User.find_by_credentials("notbob", "iambob")).to be_nil
    end
  end


end
