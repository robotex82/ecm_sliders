Ecm::Sliders.configure do |config|
  # Item options

  # image sizes for slider items
  config.item_image_styles = {
    :small_thumb  => "80x60>",
    :medium_thumb => "160x120>",
    :slider       => "830x477"
  }

  # Accepted markup languages for the item body
  config.markup_languages = %w[ markdown rdoc textile ]

  # Default markup language for the item body
  config.default_markup_language = 'textile'
end

