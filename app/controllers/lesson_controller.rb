class LessonController < ApplicationController
  before_action :set_message, only: :step7

  def step1
    render plain: "こんにちは、#{params[:name]}さん"
  end

  def step2
    render plain: params[:controller] + "#" + params[:action]
  end

  def step3
    redirect_to action: "step4"
  end

  def step4
    render plain: "step4に移動しました。"
  end

  def step5
    flash[:notice] = "step6に移動します。"
    redirect_to action: "step6"
  end

  def step6
    render plain: flash[:notice]
  end

  def step7
    render plain: @message
  end

  private def set_message
    @message = "こんにちは"
  end

  def step8
    @price = (2000 * 1.08).floor
  end

  def step9
    @price = 1000
    render "step8"
  end

  def step10
    @comment = "<script>alert('危険！')</script>こんにちは。"
  end

  def step11
    @comment = "<strong>安全なHTML</strong>"
  end

  def step12
    @population = 704414
    @surface = 141.31
  end

  def step13
    @time = Time.now
  end

  def step14
    @population = 127767944
  end

  def step15
    @message = "ごきげんいかが？\nRailsの勉強をがんばりましょう。"
  end

  def step18
    @zaiko = 10
  end

  def step19
    @items = { "フライパン" => 2680, "ワイングラス" => 2550,
               "ペッパーミル" => 4515, "ピーラー" => 945 }
  end
end
