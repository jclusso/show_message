require 'show_message/view_helpers'

module ShowMessage
  class Railtie < Rails::Railtie

    initializer 'show_message.setup_action_view' do
      ActiveSupport.on_load :action_view do
        include ShowMessage::ViewHelpers
      end
    end

    initializer 'show_message.setup_action_controller' do
      ActiveSupport.on_load :action_controller do
        include ShowMessage
      end
    end

  end
end
