module ShowMessage
  module ViewHelpers

    def show_message(options = {})

    scope = options[:id]

    if scope.present?
      flash_is_empty = false
      flash.keys.each do |k|
        puts k.to_s.index(scope.to_s).present?
        flash_is_empty = true unless k.to_s.index(scope.to_s).present?
      end
      return if flash_is_empty
    end


    data = []

    flash.each do |k, v|
      f = flash[k]
      if f.kind_of?(Array)
        if f
          f.each do |m|
            data << {message: m, class: k.to_s.split("_").first}
          end
        end
      else
        if f
          data << {message: v, class: k.to_s.split("_").first}
        end                                         
      end

      flash.discard(k) 
    end

    render partial: "show_message/show_message", locals: {data: data, options: options}
  end

  end
end