# ActiveCampaignRails

Simple rails wrapper for ActiveCampaign API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active-campaign-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active-campaign-rails

## Usage

Read their [API documentation](http://www.activecampaign.com/api/overview.php)for how to use this gem.

```ruby
# To setup the active_campaign
active_campaign = ActiveCampaign.new(
        api_endpoint: 'YOUR-ENDPOINT', # e.g. 'https://yourendpoint.api-us1.com'
        api_key: 'YOUR-API-KEY') # e.g. 'a4e60a1ba200595d5cc37ede5732545184165e'

# After connected, you can call Active Campaign API like this:

# To fetch your Active Campaign account data
active_campaign.account_view

# To fetch all lists
active_campaign.list_list ids: 'all'

# NOTE: For view all available API please visit http://www.activecampaign.com/api/overview.php
 
```

## Response

Here's an example JSON response for `active_campaign.list_list ids: 'all'` 

```ruby
{
     "result_code" => 1,
  "result_message" => "Success: Something is returned",
   "result_output" => "json",
         "results" => [
    {
                    "id" => "1",
                  "name" => "John Doe",
                 "cdate" => "2015-06-30 10:07:36",
               "private" => "0",
                "userid" => "1",
      "subscriber_count" => 2
    },
    {
                    "id" => "2",
                  "name" => "Jane Doe",
                 "cdate" => "2015-06-30 10:09:15",
               "private" => "0",
                "userid" => "1",
      "subscriber_count" => 0
    }
  ]
}
```


## Contributing

1. Fork it ( https://github.com/ekyfauzi/active-campaign-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
