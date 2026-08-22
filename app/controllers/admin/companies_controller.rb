class Admin::CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  before_action :set_company, only: %i[show edit update destroy]

  def index
    @companies = Company.all
  end

  def show
    @jobs = @company.jobs
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to admin_companies_path, notice: "Company created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @company.update(company_params)
      redirect_to admin_companies_path, notice: "Company updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @company.destroy
    redirect_to admin_companies_path, notice: "Company deleted!"
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :website, :description, :logo)
  end

  def require_admin
    redirect_to root_path, alert: "Not authorized" unless current_user.admin?
  end
end
