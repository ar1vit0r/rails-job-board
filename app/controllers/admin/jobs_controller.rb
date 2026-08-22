class Admin::JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  before_action :set_job, only: %i[show edit update destroy]

  def index
    @jobs = Job.includes(:company).order(created_at: :desc)
  end

  def show
    @applications = @job.job_applications
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to admin_jobs_path, notice: "Job created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @job.update(job_params)
      redirect_to admin_jobs_path, notice: "Job updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @job.destroy
    redirect_to admin_jobs_path, notice: "Job deleted!"
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :location, :remote, :salary_min, :salary_max, :company_id)
  end

  def require_admin
    redirect_to root_path, alert: "Not authorized" unless current_user.admin?
  end
end
