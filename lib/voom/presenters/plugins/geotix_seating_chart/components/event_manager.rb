require 'voom/presenters/dsl/components/event_base'

module Voom
  module Presenters
    module Plugins
      module GeotixSeatingChart
        module Components
          class EventManager < DSL::Components::EventBase
            attr_reader :subaccount_id, :secret_key, :event_id, :mode, :chart_js_url
            def initialize(subaccount_id, secret_key, **attribs, &block)
              @subaccount_id = subaccount_id
              @secret_key = secret_key
              @event_id = attribs.delete(:event_id){ nil }
              @mode = attribs.delete(:mode){ 'manageForSaleConfig' } # 'manageObjectStatuses' or 'manageForSaleConfig'. More to follow.
              @chart_js_url = attribs.fetch(:chart_js_url, Settings.config.chart_js_url)
              super(type: :geotix_event_manager, **attribs, &block)
              expand!
            end
          end
        end
      end
    end
  end
end