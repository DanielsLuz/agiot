require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "send_verification_mail" do
    let(:mail) { UserMailer.send_verification_mail }

    it "renders the headers" do
      expect(mail.subject).to eq("Send verification mail")
      expect(mail.to).to eq(["danielluz1995@gmail.com"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
