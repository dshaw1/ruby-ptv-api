# RubyPtv

A ruby wrapper for the Public Transport Victoria API V3.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_ptv'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_ptv

## Getting started

You must have a valid PTV developer API key. If you don't have one, you can find out how to register for one [here](https://www.ptv.vic.gov.au/about-ptv/ptv-data-and-reports/digital-products/ptv-timetable-api).

## Usage

Setup:

``` ruby
client = RubyPtv::Client.new(dev_id: "ID", secret_key: "SECRET")
```

### Optional global configuration:

``` ruby
client = RubyPtv.configure(
  dev_id: "ID",
  secret_key: "SECRET"
)
```
You can get the global configuration with:

``` ruby
RubyPtv.configuration # => { dev_id: "YOUR_ID", secret_key "YOUR_SECRET }
```

In case you need to reset the configuration:

```ruby
RubyPtv.reset_configuration
```

## A few examples

### Departures

You can search departures for all routes or for a single route. You can add any optional paramaters, as a hash, that are specified in the PTV api documentation (NOTE: the parameter keys MUST match the exact names specified by PTV).

```ruby
client.departures(0, 1023, direction_id: 1)
client.departures_for_route(0, 1127, 14)
```

Searching departures will return a number of nested hashes due to the number of optional params available. You can loop through the results easily:

```ruby
response = client.departures(0, 1023)

response["departures"].each do |departure|
  departure["stop_id"]          # => stop id
  departure["platform_number"]  # => platform number
end
```

### Routes

You can search all routes or search for a route with a specified route id. There are no optional paramters available for the routes methods.

```ruby
client.routes
client.route(2)
```

Searching routes will return a single array of hashes:

```ruby
routes = client.routes

routes.each do |route|
  route["route_type"]   # => route type
  route["route_name"]   # => route name
end
```

### Search

The search method allows you to query any stops, routes and myki ticket outlets with a specified search term. Just like departures, you can add any optional paramters that are specified by the PTV documentation.

```ruby
client.search("Glen Waverley", route_types: 0)
```

### Further information

The source code is fully commented with any required parameters and basic information you may need to use this wrapper. If you are unsure of any specifics of the API, such as any optional parameters available, check the official PTV documentation.

## Testing

To run the test suite:

```
bundle exec rake test
```

## Contributing

Bug reports and pull requests are welcome. Just create a new branch for your feature, add the appropriate tests and open a pull request.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

