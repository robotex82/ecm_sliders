module Ecm
  module Links
    class Routing
      def self.routes(router, options = {})
        options.reverse_merge! {}

        # router.resources :posts, :controller => 'ecm/sliders/posts'
      end
    end
  end
end

