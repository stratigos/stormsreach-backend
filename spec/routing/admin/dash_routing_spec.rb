require 'rails_helper'

RSpec.describe Admin::DashController, type: :routing do

  describe 'dashboard routing' do

    it 'routes admin root path to #index' do
      expect(get: '/admin').to route_to('admin/dash#index')
    end

  end

end
