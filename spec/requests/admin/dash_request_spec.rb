require 'rails_helper'

RSpec.describe 'Admin Dash Requests', type: :request do

  describe 'GET /admin' do
    context 'administration module root path' do
      it 'renders dashboard content' do
        get admin_root_path, params: {}

        expect(response.body).to match(/StormsReach/)
        expect(response.status).to eq(200)
      end
    end
  end

end
