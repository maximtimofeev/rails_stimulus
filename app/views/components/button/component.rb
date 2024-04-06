# frozen_string_literal: true

class Button::Component < ApplicationViewComponent
  option :text
  option :url, optional: true
  option :method, optional: true
end
