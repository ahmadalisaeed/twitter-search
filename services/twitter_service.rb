require 'twitter'

module TwitterService
	
	def self.client
		@client ||= Twitter::REST::Client.new do |config|
		  config.consumer_key        = ENV['CONSUMER_KEY'] || 'GsRuOaWvE1K52pX01zmziItom'
		  config.consumer_secret     = ENV['CONSUMER_SECRET'] || 'aNTALQvmkCr2ulBOuaVEEOazG83d8l5pGG9DBd7lZilL58aCUR'
		  config.access_token        = ENV['ACCESS_TOKEN'] || '2811222373-hVIUKj6ItRZwTRrqM1KdpQtXmDLOItXAXyT3SZR'
		  config.access_token_secret = ENV['ACCESS_SECRET'] || 'QkUWCfTbZ1tcqrU6jQpUTscYvOk9bolegIgR3gEU1PAnx'
		end
	end

	def self.search(text, result_type = 'recent')
		client.search(text, result_type: result_type)
	end
end