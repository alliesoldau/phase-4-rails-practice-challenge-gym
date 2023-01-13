class Client < ApplicationRecord
    has_many :memberships 
    has_many :gyms, through: :memberships

    validates :name, presence: true
    validates :age, presence: true
    validates_numericality_of :age, :greater_than_or_equal_to => 16
end
