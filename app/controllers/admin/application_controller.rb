class Admin::ApplicationController < ::ApplicationController
  include Auth
  add_flash_types :success, :error, :warning

  layout 'admin/base'

  def not_found
    render 'admin/not_found', status: 404
  end

  def current_user
    current_admin_user
  end
end
