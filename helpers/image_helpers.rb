module ImageHelpers
  def header_image
    if current_page.data.header_image
      "background-image: url(#{current_page.data.header_image})"
    end
  end
end
