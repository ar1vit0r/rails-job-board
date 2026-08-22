require "rails_helper"

RSpec.describe User, type: :model do
  describe "factory" do
    it "has a valid factory" do
      expect(build(:user)).to be_valid
    end

    it "has a valid admin factory" do
      expect(build(:user, :admin)).to be_valid
    end
  end

  describe "#admin?" do
    it "returns true for admin users" do
      user = build(:user, :admin)
      expect(user.admin?).to be true
    end

    it "returns false for regular users" do
      user = build(:user)
      expect(user.admin?).to be false
    end
  end
end
