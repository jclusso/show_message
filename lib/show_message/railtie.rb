require 'show_message/view_helpers'

module ShowMessage
  class Railtie < Rails::Railtie
    ActiveSupport.on_load(:action_view) do
      ::ActionView::Base.send :include, ShowMessage::ViewHelpers
    end
  end 
end