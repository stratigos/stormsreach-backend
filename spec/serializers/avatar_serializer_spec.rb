require "rails_helper"

RSpec.describe AvatarSerializer, type: :serializer do

  describe "exposed attributes" do

    let(:avatar) { build(:avatar) }

    let(:avatar_serializer) { AvatarSerializer.new avatar }

    it "should include attributes necessary for API consumer" do
      expect(avatar_serializer.attributes.keys).to contain_exactly(
        :id,
        :name,
        :town,
        :updated_at)
    end

  end

end
