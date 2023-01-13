class GymsSerializer < ActiveModel::Serializer
  attributes :name, :address

  has_many :memberships, serializer: MembershipsSerializer  
  has_many :clients, through: :memberships
end
