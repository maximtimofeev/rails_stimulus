# frozen_string_literal: true

class LoginForm::Component < ApplicationViewComponent
  option :login, optional: true
  option :password, optional: true

  def classes
    'flex flex-col justify-end gap-4'
  end
end
