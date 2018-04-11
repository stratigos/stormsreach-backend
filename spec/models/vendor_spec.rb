require "rails_helper"

RSpec.describe Avatar, type: :model do

  subject { build :vendor }

  it { is_expected.to belong_to(:avatar).inverse_of(:vendors) }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_length_of(:name).is_at_least(3) }

  it { is_expected.to validate_presence_of :town }
  it { is_expected.to validate_length_of(:town).is_at_least(3) }

  describe "#description" do

    it { is_expected.to validate_length_of(:description).is_at_least(3) }

    it "allows a blank value" do
      expect(subject).to allow_value("", nil).for(:description)
    end

  end

  describe "#deleted_at" do
    it "allows a timestamp value" do
      expect(subject).to allow_value("2018-04-11").for(:deleted_at)
    end
  end

end
