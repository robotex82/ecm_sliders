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
  attr_accessible :auto_start,
                  :description,
                  :ecm_sliders_items_attributes,
                  :ecm_sliders_items_count,
                  :identifier,
                  :interval,
                  :locale,
                  :name,
                  :slug

  accepts_nested_attributes_for :ecm_sliders_items, :allow_destroy => true

  # callbacks
  after_initialize :set_defaults

  # friendly id
  extend FriendlyId
  friendly_id :name, :use => :slugged

  # validations
  validates :locale, :inclusion => I18n.available_locales.map(&:to_s),
                     :if => proc { |slider| slider.locale.present? }
  validates :name, :presence => true,
                   :uniqueness => { :scope => :locale }

  # class methods
  def self.for_locale(locale)
    where(
      self.arel_table[:locale].eq(locale).or(
        self.arel_table[:locale].eq(nil)
      )
    ).order('locale DESC')
  end

  # instance methods

  def interval_in_milliseconds
    (interval * 1000).to_i
  end

  private

  def set_defaults
    if new_record?
      self.auto_start = Ecm::Sliders::Configuration.slider_auto_start if auto_start.nil?
      self.interval ||= Ecm::Sliders::Configuration.slider_interval
    end
  end
end

