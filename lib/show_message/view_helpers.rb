module ShowMessage
  module ViewHelpers

    def show_message(options = {})
      scope = options[:id].to_s

      if scope.present? && flash.keys.none? { |k| k.to_s.include?(scope) }
        return
      end

      data = []

      flash.each do |key, value|
        flash_type = key.to_s.split('_').first
        if key.is_a?(Array)
          value.each do |message|
            data.push(message: message, class: flash_type)
          end
        else
          data.push(message: value, class: flash_type)
        end
        flash.discard(key)
      end

      render partial: 'show_message/show_message', locals: {
        data: data, options: options
      }
    end

  end
end
