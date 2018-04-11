require "rails_helper"

RSpec.describe "Admin Vendors Requests", type: :request do

  let(:vendor_test_params) { { name: "Some Test Vendor Name", town: "Some Test Town" } }

  describe "GET /admin/vendors" do
    it "responds with an index page" do
      get admin_vendors_path, params: {}

      expect(response.body).to match(/Vendors/)
      expect(response.status).to eq(200)
    end
  end

  context "with existing resources" do

    let(:avatar) { create :avatar_with_vendor }
    let!(:vendor) { avatar.vendors.first }

    describe "GET /admin/avatars/:avatar_id/vendors/new" do
      it "responds with the create new Vendor page" do
        get new_admin_avatar_vendor_path(avatar)

        expect(response.body).to match(/Create Vendor/)
        expect(response.status).to eq(200)
      end
    end

    describe "POST /admin/vendors" do
      context "with whitelisted params" do
        it "responds with redirect to show page" do
          post admin_avatar_vendors_path(avatar), params: { vendor: vendor_test_params }

          expect(response.redirect?).to eq(true)
          expect(response.redirect_url).to match(/admin\/avatars\/#{avatar.id}\/vendors\/\d+/)
        end
      end
    end

    describe "GET /admin/vendor/:id" do
      it "responds with a show page" do
        get admin_avatar_vendor_path(avatar, vendor)

        expect(response.body).to match(vendor.name)
        expect(response.status).to eq(200)
      end
    end

    describe "GET /admin/vendor/:id/edit" do
      it "responds with an edit page" do
        get edit_admin_avatar_vendor_path(avatar, vendor)

        expect(response.body).to match(vendor.name)
        expect(response.status).to eq(200)
      end
    end

    describe "PUT /admin/vendor/:id" do
      context "with whitelisted params" do
        it "responds with a redirect to show page" do
          put admin_avatar_vendor_path(avatar, vendor), params: { vendor: vendor_test_params }

          expect(response.redirect?).to eq(true)
          expect(response.redirect_url).to match(admin_avatar_vendor_path(avatar, vendor))
        end
      end
    end

    describe "DELETE /admin/vendor/:id" do
      it "responds with redirect to index page" do
        delete admin_vendor_path(vendor)

        expect(response.redirect?).to eq(true)
        expect(response.redirect_url).to match(admin_vendors_path)
      end
    end

  end

end
