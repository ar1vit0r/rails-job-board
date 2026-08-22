class PagesController < ApplicationController
  def home
    @pagy, @jobs = pagy(Job.includes(:company).order(created_at: :desc), items: 10)
  end
end
