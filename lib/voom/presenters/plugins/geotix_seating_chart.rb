require_relative 'geotix_seating_chart/component'

module Voom
  module Presenters
    module Plugins
      module GeotixSeatingChart
        module DSLComponents
          def geotix_seating_chart(chart_id, **attributes, &block)
            self << GeotixSeatingChart::Component.new(chart_id, parent: self, **attributes, &block)
          end
        end

        module WebClientComponents
          def render_geotix_seating_chart(comp,
                                   render:,
                                   components:,
                                   index:)
            view_dir = File.join(__dir__, 'geotix_seating_chart')
            render.call :erb, :geotix_seating_chart, views: view_dir,
                        locals: {comp: comp,
                                 components: components,
                                 index: index}
          end

        end
      end
    end
  end
end
