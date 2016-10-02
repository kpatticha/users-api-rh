class UserSerializer < ActiveModel::Serializer
  attributes :object
  has_many :locations
  has_many :pictures
end
