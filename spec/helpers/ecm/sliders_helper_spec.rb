require 'spec_helper'

module Ecm
  describe SlidersHelper do
    describe "#render_slider" do
      before(:each) do
        @slider = FactoryGirl.create(:ecm_sliders_slider_with_items)
      end

      subject { helper.render_slider(@slider.name) }

      it "should include the body of all items" do
        @slider.ecm_sliders_items.each do |item|
          subject.should have_content(item.body)
        end
      end
    end
  end
end

