module ApplicationHelper

  def bootstrap_class_for(flash_type)
    case flash_type
    # green
    when :success
      "alert-success"
    # blue
    when :info
      "alert-info"
    # yellow
    when :warning
      "alert-warning"
    # red
    when :danger
      "alert-danger"
    else 
      flash_type.to_s
    end
  end

end
