require 'show_message/view_helpers'
if defined? Rails
  require 'show_message/railtie'
  require 'show_message/engine'
end

module ShowMessage

  def show_message(type, message, id: true)
    flash_sym =
      if type.to_s.include?('_')
        type
      else
        id ? "#{type}_#{controller_name}" : type.to_s
      end
    flash[flash_sym] = message
  end

end
