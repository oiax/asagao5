class TopController < ApplicationController
  def index
    @articles = Article.visible.order(released_at: :desc).limit(5)
    @articles = @articles.open_to_the_public unless current_member
  end

  def about
  end

  def bad_request
    raise ActionController::ParameterMissing, ""
  end

  def forbidden
    raise Forbidden, ""
  end

  def internal_server_error
    raise
  end
end
