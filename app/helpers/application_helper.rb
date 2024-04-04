module ApplicationHelper
  def component(name, *args, **kwargs, &block)
    component = name.to_s.camelize.constantize::Component
    kek = render(component.new(*args, **kwargs), &block)
  end
end
