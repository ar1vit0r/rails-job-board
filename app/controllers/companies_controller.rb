class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show]

  def index
    @companies = Company.all
  end

  def show
    @jobs = @company.jobs.order(created_at: :desc)
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end
end
