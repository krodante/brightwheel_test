require "rails_helper"

describe Email, type: :model do
  describe ".convert_body" do
    it "converts html tags to plain text" do
      body = "<h1>Your Bill</h1><p>$10</p>"

      new_body = Email.convert_body(body)

      expect(new_body).to_not include("<h1>")
    end
  end

  describe ".send_email" do
    let(:payload) do
      {
        text: Email.convert_body("<h1>Your Bill</h1><p>$10</p>"),
        from: "noreply@kathyrodante.com",
        from_name: "Kathy Rodante",
        subject: "Mailgun message",
        to: "kathykeppel@gmail.com",
        to_name: "Kathy Keppel"
      }
    end

    context "ENV['MAILER'] is set to 'mailgun'" do
      it "sends the email through Mailgun" do
        response = Email.new.send_email(payload)

        expect(response).to have_key("id")
        expect(response["message"]).to eq("Queued. Thank you.")
      end
    end

    context "ENV['MAILER'] is set to 'mandrill'" do
      it "sends the email through Mandrill" do
        ENV["MAILER"] = "mandrill"
        response = Email.new.send_email(payload)

        email = response.detect { |x| x["email"] }
        expect(email).to have_key("_id")
        expect(email["status"]).to eq("sent")
      end
    end
  end
end
