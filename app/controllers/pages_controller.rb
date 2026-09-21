class PagesController < ApplicationController
  def home
    @pagy, @jobs = pagy(Job.includes(:company).order(created_at: :desc), limit: 10)
  end
end
