module Ecm
  module Sliders
    class Routing
      def self.routes(router, options = {})
        options.reverse_merge!(
          { :slider_actions => [ :index ] }
        )

        router.resources :ecm_sliders_sliders, :only => options[:slider_actions], :controller => 'ecm/sliders/sliders'
      end
    end
  end
end

