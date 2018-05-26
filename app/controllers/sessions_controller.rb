class SessionsController < ApplicationController
  def create
    member = Member.find_by(name: params[:name])
    if member&.authenticate(params[:password])
      session[:member_id] = member.id
    else
      flash.alert = "名前とパスワードが一致しません"
    end
    redirect_to :root
  end

  def destroy
    session.delete(:member_id)
    redirect_to :root
  end
end
