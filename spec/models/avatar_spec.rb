require "rails_helper"

RSpec.describe Avatar, type: :model do

  subject { build :avatar }

  it { is_expected.to have_many(:vendors).inverse_of(:avatar).dependent(:destroy) }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_length_of(:name).is_at_least(3) }
  it { is_expected.to validate_uniqueness_of :name }

  it { is_expected.to validate_presence_of :town }
  it { is_expected.to validate_length_of(:town).is_at_least(3) }

  describe "#deleted_at" do
    it "allows a timestamp value" do
      expect(subject).to allow_value("2018-03-14").for(:deleted_at)
    end
  end

end
