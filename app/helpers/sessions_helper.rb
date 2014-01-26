module SessionsHelper

  def sign_in(admin)
    cookies.permanent[:admin_id] = admin.id
    self.current_admin = admin
  end

  def current_admin=(admin)
    @current_admin = admin 
  end

  def current_admin
    @current_admin ||= Admin.find_by_id(cookies[:admin_id])
  end

  def signed_in?
    !current_admin.nil?
  end

  def sign_out
    self.current_admin = nil
    cookies.delete(:admin_id)
  end
end
