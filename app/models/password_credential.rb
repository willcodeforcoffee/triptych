class PasswordCredential < ApplicationRecord
  include BCrypt

  DEFAULT_SCHEME = :

  belongs_to :user
  validates :scheme, inclusion: { in: %w(test) }

  default_scope { where(enabled: true) }

  def password=(plaintext)
  end

  private

  def lookup_password_generator(scheme)
  end
end
