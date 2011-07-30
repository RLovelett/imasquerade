module Imasquerade
  class Extractor
    public
      def Extractor.parse_itunes_uri(uri='')
        id = Extractor.extract_itunes_id(uri)
        return Extractor.fetch_and_parse_feed_from_apple(id)
      end
      def Extractor.debug_output(uri='')
        id = Extractor.extract_itunes_id(uri)
        doc = Extractor.get_raw_string(Extractor.uri_orig(id))
        File.open("#{id}.xml", 'w') {|f| f.write(doc) }
      end
    private
      def Extractor.uri_orig(id='')
        # This is the original place to check
        @@uri_orig = "http://itunes.apple.com/podcast/id#{id}"
      end

      def Extractor.uri_redirect(id='')
        # Check here if there is a redirect
        @@uri_redirect = "http://itunes.apple.com/WebObjects/DZR.woa/wa/viewPodcast?id=#{id}"
      end

      def Extractor.extract_itunes_id(url="")
        uri = URI.parse(url)
        uri_path = uri.path.match("id[0-9]+") unless uri.path.nil?
        uri_query = uri.query.match("id=[0-9]+") unless uri.query.nil?
        id = uri_path.to_s.delete!("id") || uri_query.to_s.delete!("id=")
        return id
      end

      def Extractor.get_raw_string(uri="")
        # In case there is some sort of error
        begin
          response = Curl::Easy.perform(uri) do |curl|
            curl.headers["User-Agent"] = 'iTunes/10.1.1'
          end
          return response.body_str
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

      def Extractor.fetch_and_parse_feed_from_apple(id)
        response = Extractor.get_raw_string(Extractor.uri_orig(id))
        reader = Nokogiri::XML(response)
        feed_url = reader.xpath('//@feed-url')
        return feed_url[0].value unless feed_url.count == 0
        # If we got here stuff went wrong
        File.open("#{id}.xml", 'w') {|f| f.write(response) }
        raise "Feed was un-expected"
      end
  end
end
