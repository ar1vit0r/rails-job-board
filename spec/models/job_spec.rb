require "rails_helper"

RSpec.describe Job, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end

  describe "associations" do
    it { should belong_to(:company) }
    it { should have_many(:job_applications).dependent(:destroy) }
  end

  describe "factory" do
    it "has a valid factory" do
      expect(build(:job)).to be_valid
    end
  end
end
