require "rails_helper"

describe EmailController, type: :controller do
  let(:valid_params) do
    {
      body: "this is great!",
      from: "noreply@kathyrodante.com",
      from_name: "Kathy Rodante",
      subject: "Email Test",
      to: "kathykeppel@gmail.com",
      to_name: "Kathy Keppel"
    }
  end

  describe "POST #email" do
    context "when there are correct params" do
      it "returns 200 OK" do
        post :email, email: valid_params

        resp = JSON.parse(response.body)
        expect(resp["message"]).to eq("ok")
      end
    end

    context "when there are missing params" do
      it "returns an error message with missing params" do
        post :email, email: { body: "invalid params" }

        resp = JSON.parse(response.body)
        expect(resp["message"])
          .to eq("Missing param(s): [\"from\", \"from_name\", \"subject\", \"to\", \"to_name\"]")
      end
    end
  end
end
