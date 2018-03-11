RSpec.describe Vfrmap do
  it "has a version number" do
    expect(Vfrmap::VERSION).not_to be nil
  end

  it "has a location subclass" do
    expect(Vfrmap::Location).not_to be nil
  end

  describe 'public instance methods' do
    subject { described_class.new('crg') }
    it { is_expected.to respond_to(:options) }
    it { is_expected.to respond_to(:uri) }
    it { is_expected.to respond_to(:src) }
    it { is_expected.to respond_to(:to_html) }
    it { is_expected.to respond_to(:to_jpg) }
    it { is_expected.to respond_to(:to_base64_jpg) }
  end

  describe 'private methods' do
    describe '#location' do
      subject { described_class.new(dd_coordinates).send(:location) }
      it { is_expected.to_not be_nil }

      context 'dd coordinates' do
        it { is_expected.to be_a(Geo::Coord) }
      end

      context 'iata airport' do
        subject { described_class.new('crg').send(:location) }
        it { is_expected.to be_a(Airports::Airport) }
      end

      context 'icao airport' do
        subject { described_class.new('kcrg').send(:location) }
        it { is_expected.to be_a(Airports::Airport) }
      end
    end

    describe '#latitude' do
      context 'dd coordinates' do
        subject { described_class.new(dd_coordinates).send(:latitude) }
        it { is_expected.to eq(dd_coordinates_arr[0].to_f) }
      end

      context 'airport' do
        subject { described_class.new('crg').send(:latitude) }
        it { is_expected.to eq(30.3362998962) }
      end
    end

    describe '#longitude' do
      context 'dd coordinates' do
        subject { described_class.new(dd_coordinates).send(:longitude) }
        it { is_expected.to eq(dd_coordinates_arr[1].to_f) }
      end

      context 'airport' do
        subject { described_class.new('crg').send(:longitude) }
        it { is_expected.to eq(-81.51439666750001) }
      end
    end
  end

  describe 'public instance methods' do
    describe '#uri' do
      subject { described_class.new(dd_coordinates).uri }
      it { is_expected.to start_with('http://vfrmap.com') }
      it { is_expected.to include('req=') }
      it { is_expected.to include('type=') }
      it { is_expected.to include('lat=') }
      it { is_expected.to include('lon=') }
      it { is_expected.to include('zoom=') }
    end

    describe '#to_html' do
      context 'defaults' do
        subject { described_class.new(dd_coordinates).to_html }
        it { is_expected.to start_with('<img') }
        it { is_expected.to include('src=') }
        it { is_expected.to_not include('class=') }
        it { is_expected.to_not include('alt=') }
      end

      context 'with class set' do
        subject { described_class.new(dd_coordinates,class: 'foo').to_html }
        it { is_expected.to include('class=') }
      end

      context 'with alt set' do
        subject { described_class.new(dd_coordinates,alt: 'foo').to_html }
        it { is_expected.to include('alt=') }
      end
    end

    describe '#to_jpg' do
      subject { described_class.new(dd_coordinates).to_jpg }
      it { is_expected.to be_a(String) }
    end

    describe '#to_base64_jpg' do
      subject { described_class.new(dd_coordinates).to_base64_jpg }
      it { is_expected.to be_a(String) }
    end
  end
end
