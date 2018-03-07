RSpec.describe Vfrmap::Location do
  describe '.factory' do
    context 'valid dd coordinates' do
      subject { described_class.factory(dd_coordinates) }
      it { is_expected.to be_a(Geo::Coord) }
    end

    context 'invalid coordinates' do
      subject { described_class.factory(invalid_coordinates) }
      it { is_expected.to be_nil }
    end

    context 'valid iata code' do
      subject { described_class.factory('crg') }
      it { is_expected.to be_a(Airports::Airport) }
    end

    context 'invalid airport code' do
      subject { described_class.factory('zxcvb') }
      it { is_expected.to be_nil }
    end
  end
end
