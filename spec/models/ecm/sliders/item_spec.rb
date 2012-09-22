require 'spec_helper'

module Ecm
  module Sliders
    describe Item do
      subject { FactoryGirl.create :ecm_sliders_item }

      context "associations" do
        it { should belong_to :ecm_sliders_slider }
      end

      context "validations" do
        it { should validate_presence_of(:ecm_sliders_slider_id) }
      end
    end
  end
end

