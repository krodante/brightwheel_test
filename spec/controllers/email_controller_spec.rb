require "rails_helper"

describe EmailController, type: :controller do

  describe "POST #email" do
    it "returns 200 OK json" do
      post :email

      resp = JSON.parse(response.body)
      expect(resp["message"]).to eq("ok")
    end
  end

end