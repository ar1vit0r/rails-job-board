class JobApplicationsController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @job_application = @job.job_applications.build(job_application_params)

    if @job_application.save
      redirect_to @job, notice: "Application submitted!"
    else
      render "jobs/show", status: :unprocessable_entity
    end
  end

  private

  def job_application_params
    params.require(:job_application).permit(:name, :email, :message)
  end
end
