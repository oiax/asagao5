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
    current_password = account_params[:current_password]

    if current_password.present?
      if @member.authenticate(current_password)
        @member.assign_attributes(account_params)
        if @member.save
          redirect_to :account, notice: "パスワードを変更しました。"
        else
          render "edit"
        end
      else
        @member.errors.add(:current_password, :wrong)
        render "edit"
      end
    else
      @member.errors.add(:current_password, :empty)
      render "edit"
    end
  end

  # ストロング・パラメータ
  private def account_params
    params.require(:account).permit(
      :current_password,
      :password,
      :password_confirmation
    )
  end
end
