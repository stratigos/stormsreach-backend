require "rails_helper"

RSpec.describe "Admin Avatars Requests", type: :request do

  let(:avatar_test_params) { { name: "Some Test Name", town: "Some Test Town" } }

  describe "GET /admin/avatars" do
    it "responds with an index page" do
      get admin_avatars_path, params: {}

      expect(response.body).to match(/Avatars/)
      expect(response.status).to eq(200)
    end
  end

  describe "POST /admin/avatars" do
    context "with whitelisted params" do
      it "responds with redirect to show page" do
        post admin_avatars_path, params: { avatar: avatar_test_params }

        expect(response.redirect?).to eq(true)
        expect(response.redirect_url).to match(/admin\/avatars\/\d+/)
      end
    end
  end

  context "with existing resources" do

    let!(:avatar) { create :avatar }

    describe "GET /admin/avatar/:id" do
      it "responds with a show page" do
        get admin_avatar_path(avatar)

        expect(response.body).to match(avatar.name)
        expect(response.status).to eq(200)
      end
    end

    describe "GET /admin/avatar/:id/edit" do
      it "responds with an edit page" do
        get edit_admin_avatar_path(avatar)

        expect(response.body).to match(avatar.name)
        expect(response.status).to eq(200)
      end
    end

    describe "PUT /admin/avatar/:id" do
      context "with whitelisted params" do
        it "responds with a redirect to show page" do
          put admin_avatar_path(avatar), params: { avatar: avatar_test_params }

          expect(response.redirect?).to eq(true)
          expect(response.redirect_url).to match(admin_avatar_path(avatar))
        end
      end
    end

    describe "DELETE /admin/avatar/:id" do
      it "responds with redirect to index page" do
        delete admin_avatar_path(avatar)

        expect(response.redirect?).to eq(true)
        expect(response.redirect_url).to match(admin_avatars_path)
      end
    end

  end

end
