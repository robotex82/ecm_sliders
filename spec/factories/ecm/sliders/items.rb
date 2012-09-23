FactoryGirl.define do
  factory :ecm_sliders_item, :class => Ecm::Sliders::Item do
    ecm_sliders_slider
    markup_language 'textile'
  end
end

