require_relative 'geotix_seating_chart/components/chart'
require_relative 'geotix_seating_chart/components/designer'
require_relative 'geotix_seating_chart/components/event_manager'

module Voom
  module Presenters
    module Plugins
      module GeotixSeatingChart
        module DSLComponents
          def geotix_seating_chart(subaccount_id, chart_key, public_key, **attributes, &block)
            self << GeotixSeatingChart::Components::Chart.new(subaccount_id,
                                                              chart_key,
                                                              public_key,
                                                              parent: self, **attributes, &block)
          end

          def geotix_seating_designer(subaccount_id, designer_key, **attributes, &block)
            self << GeotixSeatingChart::Components::Designer.new(subaccount_id,
                                                                 designer_key,
                                                                 parent: self, **attributes, &block)
          end

          def geotix_event_manager(subaccount_id, secret_key, **attributes, &block)
            self << GeotixSeatingChart::Components::EventManager.new(subaccount_id,
                                                                     secret_key,
                                                                     parent: self, **attributes, &block)
          end
        end

        module WebClientComponents
          VIEW_DIR = File.join(__dir__, 'geotix_seating_chart/views')

          def render_geotix_seating_chart(comp,
                                   render:,
                                   components:,
                                   index:)
            render.call :erb, :geotix_seating_chart, views: VIEW_DIR,
                        locals: {comp: comp,
                                 components: components,
                                 index: index}
          end

          def render_geotix_seating_designer(comp,
                                             render:,
                                             components:,
                                             index:)
            render.call :erb, :geotix_seating_designer, views: VIEW_DIR,
                        locals: {comp: comp,
                                 components: components,
                                 index: index}
          end

          def render_geotix_event_manager(comp,
                                          render:,
                                          components:,
                                          index:)
            render.call :erb, :geotix_event_manager, views: VIEW_DIR,
                        locals: {comp: comp,
                                 components: components,
                                 index: index}
          end

        end
      end
    end
  end
end
