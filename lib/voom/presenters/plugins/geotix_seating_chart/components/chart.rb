require 'voom/presenters/dsl/components/event_base'

module Voom
  module Presenters
    module Plugins
      module GeotixSeatingChart
        module Components
          class Chart < DSL::Components::EventBase
            attr_reader :subaccount_id, :chart_key, :event_id, :public_key
            def initialize(subaccount_id, chart_key, public_key, **attribs, &block)
              @subaccount_id = subaccount_id
              @chart_key = chart_key
              @public_key = public_key
              @event_id = attribs.delete(:event_id){ nil }
              super(type: :geotix_seating_chart, **attribs, &block)
              expand!
            end
          end
        end
      end
    end
  end
end
