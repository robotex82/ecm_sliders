module Ecm::SlidersHelper
  def render_slider(name, options = {})
    slider = Ecm::Sliders::Slider.where(:name => name)
    if slider.nil?
      I18n.t('ecm.sliders.slider.warnings.not_found', :name => name)
    else
      render slider
    end
  end
end
