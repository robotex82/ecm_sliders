class Ecm::Sliders::SlidersController < ApplicationController
  def index
    @sliders = Ecm::Sliders::Slider.all
  end
end

