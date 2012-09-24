module Ecm::SlidersHelper
  def render_slider(name, options = {})
    slider = Ecm::Sliders::Slider.where(:name => name.to_s).first
    if slider.nil?
      return I18n.t('ecm.sliders.slider.warnings.not_found', :name => name)
    else
      return render(slider)
    end
  end
end
