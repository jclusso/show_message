module ShowMessage
  module ViewHelpers

    # render the applicable messages
    #
    # @param options_or_ids options or the ids to target
    # @param options options for the view
    def show_message(options_or_ids = nil, options = nil)
      if options_or_ids.is_a?(Hash)
        display_ids = []
        options = options_or_ids
      else
        display_ids = options_or_ids
        options ||= {}
      end

      display_ids = display_ids.is_a?(Array) ? display_ids : [display_ids]
      display_ids = display_ids.compact.map(&:to_s)
      # target all messages if no target is specified
      display_ids.push('all') if display_ids.empty?

      data = []
      message_keys = %w(success error warning info notice alert)

      flash.to_h.slice(*message_keys).each do |key, message_hash|
        # support basic usage of flash[:success] or flash[:error] which
        # would normally just return a string
        if message_hash.is_a?(Hash)
          message_hash.each do |id, messages|
            next unless display_ids.include?('all') || display_ids.include?(id)

            build_data(data, messages, key)
          end
        else
          next unless display_ids.include?('all')

          build_data(data, message_hash, key)
        end

        flash.discard(key)
      end

      render partial: 'show_message/show_message', locals: {
        data: data, options: options
      }
    end

    private

    # support for messages to be an array. this will add multiple items to the
    # data array to be rendered.
    def build_data(data, messages, key)
      messages = messages.is_a?(Array) ? messages : [messages]
      messages.each do |message|
        data.push(message: message, class: key)
      end
    end
  end
end
