require "active-campaign-rails/version"
require "active-campaign-rails/configuration"

module ActiveCampaignRails
  def self.configuration
    @configuration ||=  Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end

  def method_missing(api_action, *args, &block)
    client = {
      list_list: {
        method: 'get'
      },
      contact_add: {
        method: 'post'
      }
    }
    api_endpoint = @configuration.api_endpoint # e.g. 'https://yourendpoint.api-us1.com'
    api_key = @configuration.api_key # e.g. 'a4e60a1ba200595d5cc37ede5732545184165e'
    api_output = @configuration.api_output
    api_url = "#{api_endpoint}/admin/api.php?api_key=#{api_key}&api_action=#{api_action.to_s}&api_output=#{api_output}"

    case client[api_action][:method]


    when 'get'
      # Get
      url_params = (args.present?) ? args.first.map{|k,v| "#{k}=#{v}"}.join('su&') : nil
      api_url = (url_params.present?) ? "#{api_url}&#{url_params}" : api_url
      response = Net::HTTP.get(URI.parse("#{api_url}"))

    when 'post'
      params = { :email => 'user2@test.com', :first_name => 'User2', :last_name => 'Last2'}
      response = Net::HTTP.post_form(URI.parse("#{api_url}"), params)
    end

    # Post
    # binding.pry
    return response

  end
end
