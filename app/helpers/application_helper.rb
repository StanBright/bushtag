module ApplicationHelper
  include PathHelpers

  def help_text(model, attribute, text = nil)
    if model.errors[attribute].present?
      "<div class='help-text help-text-errors'>#{model.errors[attribute].first.capitalize}</div>".html_safe
    elsif text
      "<div class='help-text'>#{text}</div>".html_safe
    end
  end
end
