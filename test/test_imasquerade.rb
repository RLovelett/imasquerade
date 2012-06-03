require 'helper'

class TestImasquerade < Test::Unit::TestCase
  should "perform the example in the README" do
    uri = "http://itunes.apple.com/us/podcast/the-f-u-sports-talk-podcast/id356478903"
    proper_response = "http://www.urannonline.com/Collection_Site/The_F_U_Sports_Talk_Podcast/rss.xml"
    response = Imasquerade::Extractor.parse_itunes_uri uri
    assert_equal(proper_response, response)
  end
end
