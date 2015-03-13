class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :value, inclusion: { in: [1, -1], message: "%{vaalue} is not a valide vote" }
end
