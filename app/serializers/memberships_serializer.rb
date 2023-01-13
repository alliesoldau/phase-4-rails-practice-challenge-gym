class MembershipsSerializer < ActiveModel::Serializer
  attributes :charge
  has_one :client, serializer: ClientsSerializer
  has_one :gym, serializer: GymsSerializer
end
