FactoryGirl.define do
  factory :ecm_sliders_slider, :class => Ecm::Sliders::Slider do
    sequence(:name) { |i| "Slider ##{i}" }
  end
end

