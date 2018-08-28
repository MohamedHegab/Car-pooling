class RoleRouteConstraint
  def initialize(&block)
    @block = block || lambda { |user| true }
  end

  def matches?(request)
    user = current_user(request)
    user.present? && @block.call(user)
  end

  def current_user(request)
    session_key = request.session["warden.user.user.key"]
    if session_key
      User.find_by_id(session_key[0][0])
    end
  end
end