class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :instructions, :created_at
end
