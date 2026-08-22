class Job < ApplicationRecord
  belongs_to :company
  has_many :job_applications, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
end
