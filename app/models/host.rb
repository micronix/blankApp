class Host < ActiveRecord::Base
  has_many :paths
  has_many :issues, through: :paths
end
