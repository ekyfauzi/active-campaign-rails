require "active-campaign-rails/version"
require "active-campaign-rails/client"

class ActiveCampaign

  # Makes the Client's methods available to an instance of the ActiveCampaign class
  include ActiveCampaign::Client

  attr_reader :api_endpoint, :api_key

  def initialize(args)

    # Parse args into instance_variable
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end

    # Set default api_output to json if not set
    @api_output = 'json' if @api_output.blank?

  end


  def method_missing(api_action, *args, &block)

    # Generate api_url
    api_url = generate_api_url(api_action)

    # Check method for api_action given
    case action_calls[api_action][:method]
    when 'get'

      # Generate API parameter from given argument
      api_params = (args.present?) ? args.first.map{|k,v| "#{k}=#{v}"}.join('&') : nil

      # Join API url and API parameters
      api_url = (api_params.present?) ? "#{api_url}&#{api_params}" : api_url

      # Make a call to API server with GET method
      response = RestClient.post(api_url)

      # Return response from API server
      # Default to JSON
      return response

    when 'post'

      # API parameters for POST method
      api_params = args.first

      # Make a call to API server with POST method
      response = RestClient.post(api_url, api_params)

      # Return response from API server
      # Default to JSON
      return response.body

    when 'delete'

      # API parameters for DELETE method
      api_params = args.first.merge(api_key: generate_api_key(api_action), api_output: @api_output)

      # Make a call to API server with DELETE method
      response = RestClient::Request.execute(method: :delete, url: api_url, headers: { params: api_params })

      # Return response from API server
      # Default to JSON
      return response.body

    end

  end

  private

    def generate_api_key api_action
      action_calls[api_action][:authentication] == false ? @api_key : nil
    end

    def generate_api_url api_action
      host = action_calls[api_action][:endpoint] || @api_endpoint
      path = action_calls[api_action][:path]     || '/admin/api.php'

      "#{host}#{path}?api_key=#{generate_api_key(api_action)}&api_action=#{api_action.to_s}&api_output=#{@api_output}"
    end
end
