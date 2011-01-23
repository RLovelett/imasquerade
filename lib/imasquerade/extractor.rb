module Imasquerade
  class Extractor
    public
      def Extractor.parse_itunes_uri(uri='')
        id = Extractor.extract_itunes_id(uri)
        return Extractor.fetch_and_parse_feed_from_apple(id)
      end
    private
      def Extractor.extract_itunes_id(url="")
        uri = URI.parse(url)
        uri_path = uri.path.match("id[0-9]+") unless uri.path.nil?
        uri_query = uri.query.match("id=[0-9]+") unless uri.query.nil?
        id = uri_path.to_s.delete!("id") || uri_query.to_s.delete!("id=")
        return id
      end
      
      def Extractor.fetch_and_parse_feed_from_apple(id)
        uri = "http://itunes.apple.com/podcast/id#{id}"
        response = Curl::Easy.perform(uri) do |curl|
          curl.headers["User-Agent"] = 'iTunes/10.1.1'
        end
        # In case there is some sort of error
        begin
          reader = Nokogiri::XML(response.body_str)
          array_of_feeds = reader.xpath('//xmlns:key[text()="feedURL"]/following-sibling::xmlns:string[1]/text()')
          return array_of_feeds[0].to_s
        rescue Nokogiri::XML::SyntaxError => e
          puts "Caught exception: #{e}"
          return ""
        end
      end    
  end
end