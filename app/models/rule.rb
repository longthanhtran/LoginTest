class Rule < ApplicationRecord
  belongs_to :user
  enum permission: [:allow, :deny]

  # include ActiveModel::Validations
  # validates_with CidrValidator, presence: { strict: true }
  validates :cidr, format: { with: /\A(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/(3[0-2]|[1-2][0-9]|[0-9]))\Z/, messages: "Invalid CIDR"}
end
