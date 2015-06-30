module ActiveCampaignRails

  class Configuration
    attr_accessor :api_key, :log_level

    def initialize
      self.api_endpoint = nil
      self.api_key = nil
      self.api_output = 'json'
    end
  end
end