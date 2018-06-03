class ApplicationController < ActionController::Base
  private def current_member
    Member.find_by(id: session[:member_id]) if session[:member_id]
  end
  helper_method :current_member

  class LoginRequired < StandardError; end
  class Forbidden < StandardError; end

  if Rails.env.production? || ENV["RESCUE_EXCEPTIONS"]
    rescue_from StandardError, with: :rescue_500
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_404
    rescue_from ActionController::ParameterMissing, with: :rescue_400
  end

  rescue_from LoginRequired, with: :rescue_login_required
  rescue_from Forbidden, with: :rescue_403

  private def login_required
    raise LoginRequired unless current_member
  end

  private def rescue_400(exception)
    render "errors/bad_request", status: 400, layout: "error",
      formats: [:html]
  end

  private def rescue_login_required(exception)
    render "errors/login_required", layout: "error", formats: [:html]
  end

  private def rescue_403(exception)
    render "errors/forbidden", status: 403, layout: "error",
      formats: [:html]
  end

  private def rescue_404(exception)
    render "errors/not_found", status: 404, layout: "error",
      formats: [:html]
  end

  private def rescue_500(exception)
    render "errors/internal_server_error", status: 500, layout: "error",
      formats: [:html]
  end
end
