require 'rails_helper'

RSpec.describe PasswordCredential, type: :model do
  describe "defaults" do
    subject do
      # Don't use the factory
      cred = PasswordCredential.new
      cred.save
      cred
    end

    it "should be enabled" do
      expect (subject.enabled).to be_true
    end
  end
end
