module Imasquerade
  @itunes_id_regex = /(?:id=?)(?<id>[0-9]+)/i

  def self.parse_itunes_uri(uri)
    # Extract the iTunes id from the URI
    id = uri.match(@itunes_id_regex)[:id]

    # Get raw JSON search
    response = HTTParty.get('https://itunes.apple.com/lookup', {query: {id: id}})

    # Parse the JSON to a Hash
    hash = MultiJson.load(response.body, symbolize_keys: true)

    # Extract the first feed URL
    hash[:results].first[:feedUrl] if hash.has_key?(:results) && hash[:resultCount] > 0
  end
end
