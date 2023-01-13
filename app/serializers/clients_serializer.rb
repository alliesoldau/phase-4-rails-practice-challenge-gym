class ClientsSerializer < ActiveModel::Serializer
  attributes :name, :age, :find_client_costs

  has_many :memberships, serializer: MembershipsSerializer 
  has_many :gyms, through: :memberships

  def find_client_costs
      object.memberships.to_a.sum(&:charge)
  end

end
