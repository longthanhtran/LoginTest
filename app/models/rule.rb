class Rule < ApplicationRecord
  enum permission: [:allow, :deny]
end
