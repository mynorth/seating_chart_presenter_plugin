require 'voom/presenters/dsl/components/event_base'

module Voom
  module Presenters
    module Plugins
      module GeotixSeatingChart
        module Components
          class Designer < DSL::Components::EventBase
            attr_reader :subaccount_id, :designer_key, :chart_key, :disabled, :readonly
            def initialize(subaccount_id, designer_key, **attribs, &block)
              @subaccount_id = subaccount_id
              @designer_key = designer_key
              @chart_key = attribs.delete(:chart_key){ nil }
              @disabled = attribs.delete(:disabled){ [] }
              @readonly = attribs.delete(:readonly){ [] }
              super(type: :geotix_seating_designer, **attribs, &block)
              expand!
            end
          end
        end
      end
    end
  end
end