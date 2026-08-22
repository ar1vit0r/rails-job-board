require "rails_helper"

RSpec.describe JobApplication, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end

  describe "associations" do
    it { should belong_to(:job) }
  end

  describe "factory" do
    it "has a valid factory" do
      expect(build(:job_application)).to be_valid
    end
  end
end
