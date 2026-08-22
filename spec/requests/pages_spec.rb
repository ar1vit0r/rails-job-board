require "rails_helper"

RSpec.describe "Pages", type: :request do
  describe "GET /" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:ok)
    end

    it "displays job listings" do
      job = create(:job)
      get root_path
      expect(response.body).to include(job.title)
    end
  end
end
