require 'spec_helper'

describe Imasquerade, vcr: {
    cassette_name: 'itunes',
    record: :new_episodes
} do
  describe '.parse_itunes_uri' do
    let(:uri) { 'https://itunes.apple.com/us/podcast/wdw-radio-show-your-walt-disney/id215517191?mt=2' }
    let(:expected_response) { 'http://www.wdwradio.com/xml/wdwradio.xml' }

    subject(:response) { Imasquerade.parse_itunes_uri(uri) }

    it 'should perform the example in the README' do
      expect(response).to eq(expected_response)
    end
  end

  describe 'issue #3' do
    let(:uri) { 'http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewPodcast?id=347207945' }
    let(:expected_response) { 'http://feeds.feedwrench.com/TeachMeToCodeiPhone.rss' }

    subject(:response) { Imasquerade.parse_itunes_uri(uri) }

    it 'should resolve the podcast in issue #3' do
      expect(response).to eq(expected_response)
    end
  end
end