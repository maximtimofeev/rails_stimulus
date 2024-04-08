# frozen_string_literal: true

class Button::Component < ApplicationViewComponent
  option :text
  option :type
  option :url, optional: true
  option :method, optional: true

  def container_classes
    classes = "flex items-center rounded-md border border-solid border-purple-500
               h-8 px-3 cursor-pointer transition-colors "

    case @type
    when :success
      classes + "bg-green-400 hover:bg-green-500"
    when :warning
      classes + "bg-yellow-400 hover:bg-yellow-500 "
    when :danger
      classes + "bg-red-400 hover:bg-red-500 "
    when :button
      classes + 'bg-gray-200 hover:bg-gray-300'
    when :submit
      classes + 'bg-gray-200 hover:bg-gray-300'
    else
      classes
    end
  end
end
