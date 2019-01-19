class Rule < ApplicationRecord
  belongs_to :user
  enum permission: [:allow, :deny]
end
