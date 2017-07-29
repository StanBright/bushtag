module ModelErrors
  extend self

  def extract(model)
    return if model.errors.blank?
    html = "<ul class='validation-errors'>"
    model.errors.each do |key, value|
      html = "#{html}\n<li>#{key.to_s.humanize.titleize} #{value}</li>"
    end
    html = "#{html}</ul>"
    html.html_safe
  end
end
