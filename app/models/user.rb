class User < ApplicationRecord
    validates :display_name, presence: true
    validates :email_address, presence: true, uniqueness: true

    default_scope { where(enabled: true) }
end
