require 'voom/presenters/dsl/components/event_base'

module Voom
  module Presenters
    module Plugins
      module SeatingChart
        class Component < DSL::Components::EventBase
          attr_reader :chart_id
          def initialize(chart_id, **attribs_, &block)
            @chart_id = chart_id
            super(type: :seating_chart, **attribs_, &block)
            expand!
          end
        end
      end
    end
  end
end
