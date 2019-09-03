class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :summary, :category, :description
end
