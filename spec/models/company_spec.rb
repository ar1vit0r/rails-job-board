require "rails_helper"

RSpec.describe Company, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "associations" do
    it { should have_many(:jobs).dependent(:destroy) }
  end

  describe "factory" do
    it "has a valid factory" do
      expect(build(:company)).to be_valid
    end
  end
end
