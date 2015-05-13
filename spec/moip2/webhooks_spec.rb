describe Moip2::WebhooksApi do
	let(:webhooks_api) { described_class.new sandbox_oauth_client }
	
	describe "#show" do
		
		let(:webhooks) do
			VCR.use_cassette("get_webhooks") do
				webhooks_api.show
			end
		end
		
		context 'when shooting request by webhooks' do
			it { expect(webhooks).not_to be_nil }
		end
		
	end

end