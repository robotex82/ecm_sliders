class Ecm::Sliders::Slider < ActiveRecord::Base
  self.table_name = 'ecm_sliders_sliders'

  # associations
  has_many :ecm_sliders_items,
           :class_name => Ecm::Sliders::Item,
           :dependent => :destroy,
           :foreign_key => :ecm_sliders_slider_id,
           :order => 'position'

  # attributes
  attr_accessible :description,
                  :ecm_sliders_items_count,
                  :identifier,
                  :name,
                  :slug

  # validations
  validates :name, :presence => true,
                   :uniqueness => true
end

