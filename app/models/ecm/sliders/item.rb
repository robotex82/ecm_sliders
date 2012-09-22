class Ecm::Sliders::Item < ActiveRecord::Base
  self.table_name = 'ecm_sliders_items'

  # associations
  belongs_to :ecm_sliders_slider,
             :class_name => Ecm::Sliders::Slider,
             :counter_cache => :ecm_sliders_items_count

  # attributes
  attr_accessible :body,
                  :ecm_sliders_slider,
                  :image_content_type,
                  :image_file_name,
                  :image_file_size,
                  :image_fingerprint,
                  :image_updated_at,
                  :position

  # validations
  validates :ecm_sliders_slider_id, :presence => true
end

