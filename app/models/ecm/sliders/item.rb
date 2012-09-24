class Ecm::Sliders::Item < ActiveRecord::Base
  self.table_name = 'ecm_sliders_items'

  # acts as list
  acts_as_list :scope => :ecm_sliders_slider

  # acts as markup
  acts_as_markup :language => :variable, :columns => [ :body ]

  # associations
  belongs_to :ecm_sliders_slider,
             :class_name => Ecm::Sliders::Slider,
             :counter_cache => :ecm_sliders_items_count,
             :inverse_of => :ecm_sliders_items

  # attributes
  attr_accessible :body,
                  :ecm_sliders_slider,
                  :ecm_sliders_slider_id,
                  :image,
                  :image_file_name,
                  :image_file_size,
                  :image_content_type,
                  :image_finger_print,
                  :image_updated_at,
                  :position,
                  :url

  # callbacks
  after_initialize :set_defaults

  # paperclip
  has_attached_file :image,
                    :styles => Ecm::Sliders::Configuration.item_image_styles

  # validations
  validates :ecm_sliders_slider, :presence => true
  validates :markup_language, :presence  => true,
                              :inclusion => Ecm::Sliders::Configuration.markup_languages

  private

  def set_defaults
    if self.new_record?
      self.markup_language ||= Ecm::Sliders::Configuration.default_markup_language
    end
  end
end

