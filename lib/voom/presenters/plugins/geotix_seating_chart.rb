require_relative 'geotix_seating_chart/components/component'

module Voom
  module Presenters
    module Plugins
      module GeotixSeatingChart
        module DSLComponents
          def geotix_seating_chart(chart_id, **attributes, &block)
            self << GeotixSeatingChart::Components::Chart.new(chart_id, parent: self, **attributes, &block)
          end

          def geotix_seating_designer(chart_id, **attributes, &block)
            self << GeotixSeatingChart::Components::Designer.new(chart_id, parent: self, **attributes, &block)
          end

          def geotix_event_manager(chart_id, **attributes, &block)
            self << GeotixSeatingChart::Components::EventManager.new(chart_id, parent: self, **attributes, &block)
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
