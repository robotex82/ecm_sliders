require 'spec_helper'

module Ecm
  module Sliders
    describe Slider do
      subject { FactoryGirl.create :ecm_sliders_slider }

      context "associations" do
        it { should have_many :ecm_sliders_items }
      end

      context "friendly id" do
        subject { Factory.create(:ecm_sliders_slider, :name => 'Look, a slugged category!') }
        its(:to_param) { should eq('look-a-slugged-category') }
      end

      context "validations" do
        it { should validate_presence_of :name }
        it { should validate_uniqueness_of :name }
      end
    end
  end
end

