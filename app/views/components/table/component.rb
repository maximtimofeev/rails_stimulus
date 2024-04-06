# frozen_string_literal: true

class Table::Component < ApplicationViewComponent
  param :columns, default: proc { [] }
  option :data

  def column(label, *rest, &block)
    @columns << Column.new(label, rest[0], &block)
  end  

  private

  def before_render
    content 
  end

  class Column # a value object to hold the column definition
    attr_reader :label, :td_block

    def initialize(label, static_size, &block)
      @label = label
      @static_size = static_size
      @td_block = block
    end

    def static_size
      if @static_size.present?
        @static_size.is_a?(Integer) ? "#{@static_size}px" : @static_size
      else
        'auto'
      end
    end
  end
end
