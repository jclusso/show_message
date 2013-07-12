require 'show_message/view_helpers'

module ShowMessage
  class Railtie < Rails::Railtie
    initializer "show_message.view_helpers" do |app|
      ActionView::Base.send :include, ViewHelpers
    end
  end 
end