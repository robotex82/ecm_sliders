class Ecm::Sliders::SlidersController < ApplicationController
  def index
    @sliders = Ecm::Sliders::Slider.for_locale(I18n.locale).all
  end
end

