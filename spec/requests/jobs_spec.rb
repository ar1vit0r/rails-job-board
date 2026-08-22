require "rails_helper"

RSpec.describe "Jobs", type: :request do
  describe "GET /jobs" do
    it "returns http success" do
      get jobs_path
      expect(response).to have_http_status(:ok)
    end

    it "displays job listings" do
      job = create(:job)
      get jobs_path
      expect(response.body).to include(job.title)
    end
  end

  describe "GET /jobs/:id" do
    it "returns http success" do
      job = create(:job)
      get job_path(job)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /jobs with search" do
    it "filters jobs by title" do
      rails_job = create(:job, title: "Rails Developer")
      python_job = create(:job, title: "Python Developer")
      get jobs_path(q: "Rails")
      expect(response.body).to include("Rails Developer")
      expect(response.body).not_to include("Python Developer")
    end

    it "filters remote jobs" do
      remote_job = create(:job, remote: true)
      office_job = create(:job, remote: false)
      get jobs_path(remote: "1")
      expect(response.body).to include(remote_job.title)
      expect(response.body).not_to include(office_job.title)
    end
  end
end
