module Moip2
	class WebhooksApi
		attr_reader :client

		def initialize(client)
			@client = client
		end

		def base_path(resource_id: nil)
			["", "v2", "webhooks", resource_id].compact.join("/")
		end

		def find_all(resource_id)
			Resource::Webhooks.new(client, client.get(base_path(resource_id)))
		end

	end
end
