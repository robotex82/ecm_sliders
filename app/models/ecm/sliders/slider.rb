class Ecm::Sliders::Slider < ActiveRecord::Base
  self.table_name = 'ecm_sliders_sliders'

  # associations
  has_many :ecm_sliders_items,
           :class_name => Ecm::Sliders::Item,
           :dependent => :destroy,
           :foreign_key => :ecm_sliders_slider_id,
           :order => 'position',
           :inverse_of => :ecm_sliders_slider

  # attributes
  attr_accessible :description,
                  :ecm_sliders_items_attributes,
                  :ecm_sliders_items_count,
                  :identifier,
                  :name,
                  :slug

  accepts_nested_attributes_for :ecm_sliders_items, :allow_destroy => true

  # friendly id
  extend FriendlyId
  friendly_id :name, :use => :slugged

  # validations
  validates :name, :presence => true,
                   :uniqueness => true
end

