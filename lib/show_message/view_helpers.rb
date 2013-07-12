module ShowMessage
  module ViewHelpers

    def show_message(options = {}, *args)

      options = {autohide: false}.merge!(options) 
      if options[:id].present?
        class_mappings = {"success_#{options[:id]}".to_sym => "success", "error_#{options[:id]}".to_sym => "error", "warning_#{options[:id]}".to_sym => "warning", "info_#{options[:id]}".to_sym => "info"} 
        flash_is_empty = false
        class_mappings.each_key do |k|
          flash_is_empty = false unless flash[k].nil?
        end
        return if flash_is_empty
      else
        class_mappings = {:success => "success", :error => "error", :warning => "warning", :info => "info"} 
      end

      data = []

      class_mappings.each_key do |k|
        if flash[k].kind_of?(Array)
          if flash[k]
            flash[k].each do |m|
              data << {:message => m, :class => class_mappings[k]}
            end
          end
        else
          if flash[k]
            data << {:message => flash[k], :class => class_mappings[k]}
          end                                         
        end    
      end
      args.each do |k|
        data << k
      end
      class_mappings.each_key { |k| flash[k] = nil }

      render :partial => "show_message/show_message", :locals => {data: data, options: options}
    end

  end
end