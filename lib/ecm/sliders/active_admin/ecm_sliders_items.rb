include ActiveAdmin::ActsAsList::Helper if defined?(::ActiveAdmin)

ActiveAdmin.register Ecm::Sliders::Item do
  # menu entry settings
  menu :parent => Proc.new { I18n.t('ecm.sliders.active_admin.menu') }.call

   # active_admin-acts_as_list
  sortable_member_actions

  form do |f|
    f.inputs do
      f.input :ecm_sliders_slider
      f.input :image, :as => :file,
                      :hint => f.template.image_tag(f.object.image.url(:thumb))
      f.input :url
      f.input :body
      f.input :markup_language, :as => :select, :collection => Ecm::Sliders::Configuration.markup_languages
    end

    f.actions
  end

  index do
    selectable_column
    column :thumbnail do |item|
      link_to(image_tag(item.image.url(:small_thumb)), [:admin, item])
    end
    column :ecm_sliders_slider
    column(:url) { |item| link_to_if(item.url.present?, item.url, item.url) }
    column :created_at
    column :updated_at
    default_actions
  end

  show do
    attributes_table do
      row(:image) { |item| image_tag(item.image.url(:slider)) }
      row :image_file_name
      row :image_file_size
      row :image_content_type
      row :image_updated_at
      row :image_fingerprint
    end

    panel Ecm::Sliders::Item.human_attribute_name(:body) do
      div { ecm_sliders_item.body }
    end
  end # show

  sidebar Ecm::Sliders::Item.human_attribute_name(:details), :only => :show do
    attributes_table_for ecm_sliders_item do
      row :ecm_sliders_slider
      row(:url) { |item| link_to_if(item.url.present?, item.url, item.url) }     
      row :created_at
      row :updated_at
    end
  end # sidebar
end if defined?(ActiveAdmin)
