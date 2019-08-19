require 'voom/presenters/dsl/components/event_base'

module Voom
  module Presenters
    module Plugins
      module GeotixSeatingChart
        module Components
          class Chart < DSL::Components::EventBase
            attr_reader :chart_key, :event_id, :public_key, :pricing, :price_format,
                        :price_level_tooltip, :available_categories, :chart_js_url
            def initialize(chart_key, public_key, **attribs, &block)
              @chart_key = chart_key
              @public_key = public_key
              @event_id = attribs.delete(:event_id){ nil }
              @pricing = attribs.delete(:pricing){ [] }
              @price_format = attribs.delete(:price_format){ '$' }
              @price_level_tooltip = attribs.delete(:price_level_tooltip){ 'Select a price level' }
              @available_categories = attribs.delete(:available_categories){ [] }
              @chart_js_url = attribs.fetch(:chart_js_url, Settings.config.chart_js_url)
              super(type: :geotix_seating_chart, **attribs, &block)
              expand!
            end

          end
        end
      end
    end
  end
end
