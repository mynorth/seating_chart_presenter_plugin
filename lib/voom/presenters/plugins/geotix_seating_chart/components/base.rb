require 'voom/presenters/dsl/components/event_base'

module Voom
  module Presenters
    module Plugins
      module GeotixSeatingChart
        module Components
          class Base < DSL::Components::EventBase

            def chart_options
              @component_options.map do |key|
                if (value = send(key))
                  [key, value]
                end
              end.compact.to_h
            end

          end
        end
      end
    end
  end
end
