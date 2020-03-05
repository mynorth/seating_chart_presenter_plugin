require_relative 'geotix_seating_chart/components/base'
require_relative 'geotix_seating_chart/components/chart'
require_relative 'geotix_seating_chart/components/designer'
require_relative 'geotix_seating_chart/components/event_manager'

module Voom
  module Presenters
    module Plugins
      module GeotixSeatingChart

        class Settings
          extend Dry::Configurable
          setting :chart_js_url, 'https://cdn.seatsio.net/chart.js'
        end

        module DSLComponents
          def geotix_seating_chart(chart_key, public_key, **attributes, &block)
            self << GeotixSeatingChart::Components::Chart.new(chart_key,
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

          def render_header_geotix_seating_chart(_pom, render:)
            view_dir = File.join(__dir__, 'geotix_seating_chart/views')
            render.call :erb, :header, views: view_dir
          end

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

        # module WebClientActions
        #   def action_data_post(action, _parent_id, *)
        #     [action.type, action.url, action.options.to_h, action.attributes.to_h]
        #   end
        # end
      end
    end
  end
end
