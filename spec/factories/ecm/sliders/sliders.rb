FactoryGirl.define do
  factory :ecm_sliders_slider, :class => Ecm::Sliders::Slider do
    sequence(:name) { |i| "Slider ##{i}" }

    factory :ecm_sliders_slider_with_items do |slider|
      slider.after_create { |s| Factory.create_list(:ecm_sliders_item, 5, :ecm_sliders_slider => s) }
      slider.ecm_sliders_items_count 5
    end
  end
end

