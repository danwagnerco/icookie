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

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

end
