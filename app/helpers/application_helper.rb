module ApplicationHelper
  def page_title
    title = "Morning Glory"
    title = @page_title + " - " + title if @page_title
    title
  end

  def menu_link_to(text, path)
    link_to_unless_current(text, path) { content_tag(:span, text) }
  end

  def add_date_unit(str)
    suffixes = ["年", "月", "日"]

    replaced = str.gsub(%r{<select .+?>.+?</select>}m) do |element|
      if md = element.match(/\(([123])i\)/)
        number = md[1].to_i
        element + suffixes[number - 1]
      else
        element
      end
    end

    replaced.html_safe
  end
end
