require_relative 'seating_chart/component'
require_relative 'seating_chart/action'

module Voom
  module Presenters
    module Plugins
      module SeatingChart
        module DSLComponents
          def seating_chart(chart_id, **attributes, &block)
            self << SeatingChart::Component.new(chart_id, parent: self, **attributes, &block)
          end
        end

        module WebClientComponents
          def render_seating_chart(comp,
                                   render:,
                                   components:,
                                   index:)
            view_dir = File.join(__dir__, 'seating_chart')
            render.call :erb, :seating_chart, views: view_dir,
                        locals: {comp: comp,
                                 components: components,
                                 index: index}
          end

        end
      end
    end
  end
end
