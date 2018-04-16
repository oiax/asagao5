module ApplicationHelper
  def page_title
    title = "Morning Glory"
    title = @page_title + " - " + title if @page_title
    title
  end

  def menu_link_to(text, path, options = {})
    content_tag :li do
      link_to_unless_current(text, path, options) do
        content_tag(:span, text)
      end
    end
  end
end
