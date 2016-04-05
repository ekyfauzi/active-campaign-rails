# ActiveCampaignRails

Simple gem for ActiveCampaign API wrapper

[![Build Status](https://semaphoreci.com/api/v1/ekyfauzi/active-campaign-rails/branches/master/badge.svg)](https://semaphoreci.com/ekyfauzi/active-campaign-rails)

[![Gem Version](https://badge.fury.io/rb/active-campaign-rails.svg)](https://badge.fury.io/rb/active-campaign-rails)

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

Read their [API documentation](http://www.activecampaign.com/api/overview.php) for how to use this gem.

```ruby
# To setup the active_campaign
active_campaign = ActiveCampaign.new(
        api_endpoint: 'YOUR-ENDPOINT', # e.g. 'https://yourendpoint.api-us1.com'
        api_key: 'YOUR-API-KEY') # e.g. 'a4e60a1ba200595d5cc37ede5732545184165e'

# After connected, you can call ActiveCampaign API like this:

# To fetch your ActiveCampaign account data
active_campaign.account_view

# To fetch all lists
active_campaign.list_list ids: 'all'

# To add new contact
active_campaign.contact_add(
      email: 'john_doe@example.com',
      first_name: 'John',
      last_name: 'Doe',
      phone: '+6287712314132')


```

To view all available API please visit http://www.activecampaign.com/api/overview.php

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
