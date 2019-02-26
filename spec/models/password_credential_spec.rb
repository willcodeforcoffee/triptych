require 'rails_helper'

RSpec.describe PasswordCredential, type: :model do
  context "defaults" do
    subject do
      # Don't use the factory
      cred = PasswordCredential.new
      cred.save
      cred
    end

    it "should be enabled" do
      expect(subject.enabled?).to be true
    end
  end
end
