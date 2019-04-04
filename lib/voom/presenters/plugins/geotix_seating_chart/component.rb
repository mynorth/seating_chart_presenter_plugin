require 'voom/presenters/dsl/components/event_base'

module Voom
  module Presenters
    module Plugins
      module GeotixSeatingChart
        class Component < DSL::Components::EventBase
          attr_reader :chart_id, :event_id
          def initialize(chart_id, **attribs, &block)
            @chart_id = chart_id
            @event_id = attribs.delete(:event_id){ nil }
            super(type: :geotix_seating_chart, **attribs, &block)
            expand!
          end
        end
      end
    end
  end
end
