class CreateUserService
  def build(display_name, email_address, password)
    @user= User.build({
      :display_name => display_name,
      :email_address => email_address,
    })

    # TODO: Create password
    @user.password_credential.build({
      :password => password
    })
  end

  def user
    @user
  end
end
