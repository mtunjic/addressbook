module ApplicationHelper

  def auth_only(&block)
    block.call if current_user
  end

  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Contact").join(" - ")
      end
    end
  end
end
