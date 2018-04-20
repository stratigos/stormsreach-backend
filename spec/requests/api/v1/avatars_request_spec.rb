require "rails_helper"

RSpec.describe "Avatar Requests", type: :request do

  describe "GET /v1/avatars" do

    it "returns status success" do
      get v1_avatars_path

      expect(response).to be_success
    end

    it "returns JSON content type" do
      get v1_avatars_path

      expect(response.content_type).to eq(Mime::CONTENT_TYPES[:json])
    end

    context "with persisted data" do

      let(:expected_avatar_count) { 2 }
      let!(:avatars) { create_list(:avatar, expected_avatar_count) }

      it "lists all Avatar records" do
        get v1_avatars_path, params: { format: :json }

        avatars_json = nil

        expect{ avatars_json = JSON.parse(response.body) }.not_to raise_error
        expect(avatars_json["data"].count).to eq(expected_avatar_count)
        expect(avatars_json["data"].first["type"]).to eq("avatars")
      end

    end

  end

end
