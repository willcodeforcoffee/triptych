class User < ApplicationRecord
    has_one :password_credential
    validates :display_name, presence: true
    validates :email_address, presence: true, uniqueness: true

    default_scope { where(enabled: true) }
end
