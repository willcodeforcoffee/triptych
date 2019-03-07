# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  before_action :redirect_when_disabled, :unless => -> { is_enabled? }

  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  protected

  def is_enabled?
    # TODO: Make this configurable!
    false
  end

  def redirect_when_disabled
    redirect_to user_session_path, :notice => "Password reset is disabled."
  end
end
