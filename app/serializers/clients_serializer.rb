class ClientsSerializer < ActiveModel::Serializer
  attributes :name, :age

  has_many :memberships, serializer: MembershipsSerializer 
  has_many :gyms, through: :memberships
end
