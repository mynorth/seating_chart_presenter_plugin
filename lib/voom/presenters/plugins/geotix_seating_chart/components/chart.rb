require 'voom/presenters/dsl/components/event_base'

module Voom
  module Presenters
    module Plugins
      module GeotixSeatingChart
        module Components
          class Chart < DSL::Components::EventBase
            attr_reader :subaccount_id, :chart_key, :event_id, :public_key,
                        :pricing, :price_format, :price_level_tooltip
            def initialize(subaccount_id, chart_key, public_key, **attribs, &block)
              @subaccount_id = subaccount_id
              @chart_key = chart_key
              @public_key = public_key
              @event_id = attribs.delete(:event_id){ nil }
              @pricing = attribs.delete(:pricing){ [] }
              @price_format = attribs.delete(:price_format){ '$' }
              @price_level_tooltip = attribs.delete(:price_level_tooltip){ 'Select a price level' }
              super(type: :geotix_seating_chart, **attribs, &block)
              expand!
            end
          end
        end
      end
    end
  end
end
