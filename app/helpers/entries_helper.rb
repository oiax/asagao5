module EntriesHelper
  def the_first_image(entry)
    image = entry.images.order(:position)[0]

    render_entry_image(image) if image
  end

  def other_images(entry)
    buffer = "".html_safe

    entry.images.order(:position)[1..-1]&.each do |image|
      buffer << render_entry_image(image)
    end

    buffer
  end

  private def render_entry_image(image)
    content_tag(:div) do
      image_tag image.data.variant(resize: "530x>"),
        alt: image.alt_text,
        style: "display: block; margin: 0 auto 15px"
    end
  end
end
