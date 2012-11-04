include ActiveAdmin::ActsAsList::Helper if defined?(::ActiveAdmin)

ActiveAdmin.register Ecm::Sliders::Slider do
  # menu entry settings
  menu :parent => Proc.new { I18n.t('ecm.sliders.active_admin.menu') }.call

  form do |f|
    f.inputs do
      f.input :locale, :as => :select, :collection => I18n.available_locales.map(&:to_s)
      f.input :name
      f.input :description
    end

    f.inputs do
      f.has_many :ecm_sliders_items do |item|
        if item.object.persisted?
          item.input :_destroy, :as => :boolean, :label => I18n.t('active_admin.delete')
        end
        item.input :image, :as => :file,
                        :hint => item.template.image_tag(item.object.image.url(:thumb))
        item.input :url
        item.input :body
        item.input :markup_language, :as => :select, :collection => Ecm::Sliders::Configuration.markup_languages
      end # f.has_many
    end

    f.actions
  end

  index do
    selectable_column

    column :name
    column :locale
    column :description
    column :ecm_sliders_items_count
    column :created_at
    column :updated_at

    default_actions
  end

  show do
    panel Ecm::Sliders::Slider.human_attribute_name(:description) do
      div { ecm_sliders_slider.description }
    end

    panel Ecm::Sliders::Slider.human_attribute_name(:ecm_sliders_items) do
      table_for ecm_sliders_slider.ecm_sliders_items, :i18n => Ecm::Sliders::Item do
        sortable_columns

        column :thumbnail do |item|
          link_to(image_tag(item.image.url(:small_thumb)), [:admin, item])
        end
        column(:url) { |item| link_to_if(item.url.present?, item.url, item.url) }
        column :created_at
        column :updated_at

        column do |item|
          link_to(I18n.t('active_admin.view'), [:admin, item], :class => "member_link view_link") +
          link_to(I18n.t('active_admin.edit'), [:edit, :admin, item], :class => "member_link edit_link")
        end
      end
    end
  end

  sidebar Ecm::Sliders::Slider.human_attribute_name(:details), :only => :show do
    attributes_table_for ecm_sliders_slider do
      row :name
      row :locale
      row :ecm_sliders_items_count
      row :created_at
      row :updated_at
    end
  end # sidebar
end if defined?(ActiveAdmin)

