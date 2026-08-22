class JobsController < ApplicationController
  before_action :set_job, only: %i[show]

  def index
    scope = Job.includes(:company).order(created_at: :desc)
    scope = scope.where("title LIKE ?", "%#{params[:q]}%") if params[:q].present?
    scope = scope.where(remote: true) if params[:remote] == "1"
    @pagy, @jobs = pagy(scope, items: 10)
  end

  def show
    @job_application = JobApplication.new
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end
end
