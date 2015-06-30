module ActiveCampaignRails

  class Configuration
    attr_accessor :api_endpoint, :api_key, :api_output

    def initialize
      self.api_endpoint = nil
      self.api_key = nil
      self.api_output = 'json'
    end
  end
end