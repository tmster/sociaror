module ApplicationHelper
 include FeedbackHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "SociaRoR"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def markdown(text)
  options = {
    :autolink => true,
    :space_after_headers => true,
    :no_intra_emphasis => true
  }
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
  markdown.render(text).html_safe
end
end
