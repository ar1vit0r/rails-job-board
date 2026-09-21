require "rails_helper"

RSpec.describe Devise::Mailer, type: :mailer do
  include MailerHelper

  let(:user) { create(:user) }

  describe "#reset_password_instructions" do
    subject(:mail) { described_class.reset_password_instructions(user, "tok123") }

    it "is sent from the Devise mailer_sender" do
      expect(mail.from).to eq([ Devise.mailer_sender ])
    end

    it "wraps the body in the themed layout with a call-to-action button" do
      body = mail.body.decoded
      expect(body).to include("Job Board", "background:#{mail_color(:board)}")
      expect(body).to include(%(bgcolor="#{mail_color(:signal)}"), "Change my password", "reset_password_token=tok123")
    end
  end

  %i[password_change email_changed].each do |name|
    it "wraps #{name} in the themed layout" do
      mail = described_class.public_send(name, user)
      expect(mail.body.decoded).to include("background:#{mail_color(:board)}", user.email)
    end
  end

  # Confirmation and unlock mails need :confirmable/:lockable, which User does not enable,
  # so their shared button partial is rendered directly.
  it "renders the call-to-action button partial used by the confirmation and unlock mails" do
    html = ApplicationController.render(partial: "devise/mailer/button", locals: { text: "Go", url: "http://x.test/a" })
    expect(html).to include('href="http://x.test/a"', ">Go<", %(bgcolor="#{mail_color(:signal)}"))
  end
end
