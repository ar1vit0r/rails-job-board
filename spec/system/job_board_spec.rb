require "rails_helper"

RSpec.describe "Job Board", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  describe "Home page" do
    it "displays job listings" do
      job = create(:job)
      visit root_path
      expect(page).to have_content(job.title)
      expect(page).to have_content(job.company.name)
    end

    it "searches for jobs" do
      rails_job = create(:job, title: "Rails Developer")
      python_job = create(:job, title: "Python Developer")
      visit root_path
      fill_in "q", with: "Rails"
      click_button "Search"
      expect(page).to have_content("Rails Developer")
      expect(page).not_to have_content("Python Developer")
    end
  end

  describe "Job details" do
    it "displays job information" do
      job = create(:job)
      visit job_path(job)
      expect(page).to have_content(job.title)
      expect(page).to have_content(job.description)
      expect(page).to have_content(job.company.name)
    end
  end

  describe "Job application" do
    it "submits an application" do
      job = create(:job)
      visit job_path(job)
      fill_in "Name", with: "John Doe"
      fill_in "Email", with: "john@example.com"
      fill_in "Message", with: "I'm interested!"
      click_button "Submit Application"
      expect(page).to have_content("Application submitted!")
    end
  end
end
