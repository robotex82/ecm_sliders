require 'spec_helper'

module Ecm
  module Sliders
    describe SlidersController do
      describe "GET index" do
        it "has a 200 status code" do
          get :index
          response.code.should eq("200")
        end
      end
    end
  end
end
