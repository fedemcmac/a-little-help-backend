class Job < ApplicationRecord
  belongs_to :user
  alias_attribute :owner, :user
  has_many :user_jobs
  has_many :helpers, through: :user_jobs, source: :user
end



