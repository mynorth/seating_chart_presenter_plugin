require 'voom/presenters/dsl/components/event_base'

module Voom
  module Presenters
    module Plugins
      module GeotixSeatingChart
        module Components
          class EventManager < DSL::Components::EventBase
            attr_reader :subaccount_id, :secret_key, :event_id
            def initialize(subaccount_id, secret_key, **attribs, &block)
              @subaccount_id = subaccount_id
              @secret_key = secret_key
              @event_id = attribs.delete(:event_id){ nil }
              @mode = attribs.delete(:mode){ 'manageObjectStatuses' } # 'manageObjectStatuses' or 'manageForSaleConfig'. More to follow.
              super(type: :geotix_event_manager, **attribs, &block)
              expand!
            end
          end
        end
      end
    end
  end
end