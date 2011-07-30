module Imasquerade
  class Extractor
    public
      def Extractor.parse_itunes_uri(uri='')
        return Extractor.fetch_and_parse_feed_from_apple(uri)
      end
      def Extractor.debug_output(uri='')
        id = Extractor.itunes_id(uri)
        doc = Extractor.get_raw_string(uri)
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

      def Extractor.itunes_id(url="")
        /(?:id=?)([0-9]+)/i =~ url
        return $1
      end

      def Extractor.get_raw_string(uri="")
        # In case there is some sort of error
        begin
          response = Curl::Easy.perform(uri) do |curl|
            curl.headers["User-Agent"] = 'iTunes/10.1.1'
          end
          return response.body_str
        rescue Nokogiri::XML::SyntaxError => e
          puts "Caught exception: #{e}".colorize(:red)
          return nil
        rescue Curl::Err::HostResolutionError => e
          puts "Caught exception: #{e}".colorize(:red)
          return nil
        rescue Curl::Err::RecvError => e
          puts "Caught exception: #{e}".colorize(:red)
          return nil
        end
      end

      def Extractor.fetch_and_parse_feed_from_apple(url)
        id = Extractor.itunes_id(url)
        response = Extractor.get_raw_string(url)
        reader = Nokogiri::XML(response)
        feed_url = reader.xpath('//@feed-url')
        return feed_url[0].value unless feed_url.count == 0
        response.force_encoding("UTF-8") if response.encoding == Encoding::ASCII_8BIT
        begin
          list = Plist::parse_xml(response)
        rescue RuntimeError => bang
          list = {}
        end
        if list.has_key?('action') && list['action']['kind'] == "Goto" then
          response = Extractor.fetch_and_parse_feed_from_apple(list['action']['url'])
          return response
        elsif list.has_key?('dialog')
          throw list['dialog']['explanation']
        end
        File.open("#{id}.html", 'w') {|f| f.write(response) }
        throw "The feed was either empty, or mal-formed."
      end
  end
end
