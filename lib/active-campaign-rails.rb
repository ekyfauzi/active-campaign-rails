require "active-campaign-rails/version"
require "active-campaign-rails/client"
require 'rest-client'

class ActiveCampaign

  # Makes the Client's methods available to an instance of the ActiveCampaign class
  include ActiveCampaign::Client

  attr_reader :api_endpoint, :api_key

  def initialize(args)

    # Parse args into instance_variable
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end

    # Set defaults
    @api_output  ||= 'json'
    @ssl_version ||= :TLSv1_2

  end


  def method_missing(api_action, *args, &block)

    # Generate api_url
    api_url = generate_api_url(api_action)

    # Check method for api_action given
    case action_calls[api_action][:method]
    when 'get'

      # Generate API parameter from given argument
      api_params = args.first

      # Make a call to API server with GET method
      response = RestClient::Request.execute(method: :get, url: api_url, headers: { params: api_params }, ssl_version: @ssl_version)

      # Return response from API server
      # Default to JSON
      return response.body

    when 'post'

      # API parameters for POST method
      api_params = args.first

      # For event tracking the visit param must have a json value
      if visit = api_params[:visit]
        api_params[:visit] = visit.to_json if visit.is_a?(Hash)
      end

      # Make a call to API server with POST method
      response = RestClient::Request.execute(method: :post, url: api_url, payload: api_params, ssl_version: @ssl_version)

      # Return response from API server
      # Default to JSON
      return response.body

    when 'delete'

      # API parameters for DELETE method
      api_params = args.first.merge(api_key: @api_key, api_output: @api_output)

      api_url = "#{action_calls[api_action][:endpoint] || @api_endpoint}#{action_calls[api_action][:path] || '/admin/api.php'}"

      # Make a call to API server with DELETE method
      response = RestClient::Request.execute(method: :delete, url: api_url, headers: { params: api_params }, ssl_version: @ssl_version)

      # Return response from API server
      # Default to JSON
      return response.body

    end

  end

  private
    def generate_api_url api_action
      host = action_calls[api_action][:endpoint] || @api_endpoint
      path = action_calls[api_action][:path]     || '/admin/api.php'

      "#{host}#{path}?api_key=#{@api_key}&api_action=#{api_action.to_s}&api_output=#{@api_output}"
    end
end
