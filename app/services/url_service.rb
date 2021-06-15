class UrlService

    def self.shorten(link)
        client = Bitly::API::Client.new(token: ENV['BITLY_TOKEN'])
        bitlink = client.shorten(long_url: "http://example.com")
        bitlink.link
    end

end