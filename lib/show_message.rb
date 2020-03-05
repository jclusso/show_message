require 'show_message/view_helpers'

if defined? Rails
  require 'show_message/railtie'
  require 'show_message/engine'
end

module ShowMessage

  def show_message(type, message, id: nil)
    id ||= 'all'
    flash[type] ||= {}
    flash[type][id.to_s] = message
  end

  def show_success(message)
    show_message(:success, message)
  end

  def show_success_for(id, message)
    show_message(:success, message, id: id)
  end

  def show_error(message)
    show_message(:error, message)
  end

  def show_error_for(id, message)
    show_message(:error, message, id: id)
  end

end
