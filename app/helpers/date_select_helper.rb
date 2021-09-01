# Usage: <%= year_field_tag(:date, model.date, class: "form-control") %>
module DateSelectHelper

  def year_field_tag(field_name, value, options = {})

    unless value.nil?
      text_field_tag(:"#{field_name}(1i)", value.try(:year), options)
    else
      text_field_tag(:"#{field_name}(1i)", value, options)
    end
  end

  def month_field_tag(field_name, value, options = {})
    unless value.nil?
      text_field_tag(:"#{field_name}(2i)", value.try(:month), options)
    else
      text_field_tag(:"#{field_name}(2i)", value, options)
    end
  end

  def day_field_tag(field_name, value, options = {})
    unless value.nil?
      text_field_tag(:"#{field_name}(3i)", value.try(:day), options)
    else
      text_field_tag(:"#{field_name}(3i)", value, options)
    end
  end

  def birth_date_format(date)
    if date 
      date.to_formatted_s(:rfc822)
    end
  end

end
