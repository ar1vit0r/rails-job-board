require "rails_helper"

RSpec.describe "JobApplications", type: :request do
  let(:job) { create(:job) }

  describe "POST /jobs/:job_id/job_applications" do
    context "with valid params" do
      it "creates a new job application" do
        expect {
          post job_job_applications_path(job), params: {
            job_application: {
              name: "John Doe",
              email: "john@example.com",
              message: "I'm interested in this position."
            }
          }
        }.to change(JobApplication, :count).by(1)

        expect(response).to redirect_to(job_path(job))
        follow_redirect!
        expect(response.body).to include("Application submitted!")
      end
    end

    context "with invalid params" do
      it "does not create a job application" do
        expect {
          post job_job_applications_path(job), params: {
            job_application: { name: "", email: "", message: "" }
          }
        }.not_to change(JobApplication, :count)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
