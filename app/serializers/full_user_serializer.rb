class FullUserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :instructions
  has_many :created_jobs
  has_many :helping_jobs
end
