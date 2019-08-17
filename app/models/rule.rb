class Rule < ApplicationRecord
  belongs_to :user
  enum permission: %i[allow deny]

  validates :cidr, format: { with: %r{\A(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(/(3[0-2]|[1-2][0-9]|[0-9]))\Z}, messages: "Invalid CIDR"}
end
