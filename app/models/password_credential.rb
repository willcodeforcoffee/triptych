class PasswordCredential < ApplicationRecord
  belongs_to :user

  default_scope { where(enabled: true) }
end
