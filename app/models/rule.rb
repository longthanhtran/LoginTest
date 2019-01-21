class Rule < ApplicationRecord
  belongs_to :user
  enum permission: [:allow, :deny]

  include ActiveModel::Validations
  validates_with CidrValidator
end
