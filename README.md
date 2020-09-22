# SeatingChartPresenterPlugin

A plugin for [voom/presenters](https://github.com/rx/presenters) which
provides three components for implementing a [Seats.io](https://seats.io) integration.
The available components are Seating Chart, Chart Designer, and Event Manager

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'seating_chart_presenter_plugin'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install seating_chart_presenter_plugin

## Usage

#### Seating Chart
```ruby
plugin :seating_chart

content do
  geotix_seating_chart('[SEATSIO_CHART_KEY]',
                       '[SEATSIO.PUBLIC_KEY]',
                       event_id: '[EVENT_ID]', # as a string
                       pricing: [
                          {category: 1, price: 30.0}, 
                          {category: 2, price: 35.0}
                       ],
                       available_categories: [1,2],
                       currency: 'USD',
                       locale: 'en-US')
end
```
#### Chart Designer
```ruby
plugin :seating_chart

content do
  geotix_seating_designer('[SUBACCOUNT_ID]',  # Now know as "workspace"
                          '[DESIGNER_KEY]',
                           chart_key: '[CHART KEY]',
                           disabled: [],  # list of disabled designer functions ie: 'focalPoint', 'backgroundImage', etc.
                           readonly: [],  # list of disabled functions ie: 'chartName', 'categoryList'
                           language: 'en',
                           open_latest_drawing: true,
                           show_on_update: '',  # ID of element to show on chart update (optional)
                           hide_on_update: '',  # ID of element to hide on chart update (optional)
                           chart_key_input_id: '' # ID of input element to store chart key (optional) 
                         )
end
```
#### Event Manager
```ruby
plugin :seating_chart

content do
  geotix_event_manager('[SUBACCOUNT_ID]', 
                       '[SECRET_KEY]',
                        event_id: '[EVENT_ID]',
                        mode: 'manageObjectStatuses' # or 'manageForSaleConfig'
                      )
end
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/chart_presenter_plugin.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
