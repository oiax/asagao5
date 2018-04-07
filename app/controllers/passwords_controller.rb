class PasswordsController < ApplicationController
  before_action :login_required

  def show
    redirect_to :account
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    if @member.authenticate(params[:current_password])
      @member.assign_attributes(account_params)
      if @member.save
        redirect_to :account, notice: "パスワードを変更しました。"
      else
        render "edit"
      end
    else
      @member.errors.add(:base, "現在のパスワードが誤っています。")
      render "edit"
    end
  end

  # ストロング・パラメータ
  private def account_params
    params.require(:account).permit(
      :password,
      :password_conrimation
    )
  end
end
