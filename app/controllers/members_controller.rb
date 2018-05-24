class MembersController < ApplicationController
  # 会員一覧
  def index
    @members = Member.order("number")
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
