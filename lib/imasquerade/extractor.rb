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
        # In case there is some sort of error
        begin
          response = Curl::Easy.perform(uri) do |curl|
            curl.headers["User-Agent"] = 'iTunes/10.1.1'
          end
          reader = Nokogiri::XML(response.body_str)
          array_of_feeds = reader.xpath('//xmlns:key[text()="feedURL"]/following-sibling::xmlns:string[1]/text()')
          siteurl = reader.at_xpath('//*[@draggingName="WEBSITE"]')['url']
          url_hash = {}
          url_hash['feedurl'] = array_of_feeds[0].to_s
          url_hash['siteurl'] = siteurl
          return url_hash
        rescue Nokogiri::XML::SyntaxError => e
          puts "Caught exception: #{e}"
          return nil
        rescue Curl::Err::HostResolutionError => e
          puts "Caught exception: #{e}"
          return nil
        rescue Curl::Err::RecvError => e
          puts "Caught exception: #{e}"
          return nil
        end
      end    
  end
end