class LessonController < ApplicationController
    def step1   #   render plainオプションはテンプレートを介さず文字列を表示する
        render plain: "こんにちは、#{params[:name]}さん"
    end
    def step2   #   paramsはルーティングの[lesson/step2/(/:name)]の:name部分を取得する
        render plain: params[:controller] + "#" + params[:action] + "&" + request.env["HTTP_USER_AGENT"]
    end
    def step3   #   actionオプションは指定したアクションにリダイレクトさせる
        redirect_to action: "step4"
    end
    def step4
        render plain: "step4に移動しました"
    end
    def step5   #   flash[:notice]はアクションとアクションの間で情報を受け渡す
        flash[:notice] = "step6に移動します"
        redirect_to action: "step6"
    end
    def step6   #   ここのflash[:notice]はstep5アクションのものを受け継いでいる
        render plain: flash[:notice]
    end
    def step7
        @price = (2000 * 1.08).floor
    end
    def step8   #   @priceがstep7のテンプレートに受け渡す
        @price = 1000
        render "step7"
    end
    def step9   #   テンプレートでは < は &lt; に、 > は &gt; に変換される
        @comment = "<script>alert('危険')</script>こんにちは。"
    end
    def step10  #   テンプレートで<%== @comment %>とすることでHTMLをそのまま表示できる(.html_safeメソッドでも可能)
        @comment = "<strong>安全なHTML</strong>"
    end
    def step11  #   sprintfで埋め込み
        @population = 704414
        @surface = 141.31
    end
    def step12  #   strftimeで埋め込み
        @time = Time.current
    end
    def step13 #    Railsメソッドnumber_with_delimiterを使用
        @population = 127767944
    end
    def step14  #   モジュールヘルパーを使用する
        @message = "ごきげんいかが？\nRailsの勉強をがんばりましょう。"
    end
    def step17
        @zaiko = 10
    end
    def step18
        @items = { "フライパン" => 2680, "ワイングラス" => 2550,
                   "ペッパーミル" => 4515, "ピーラー" => 945 }
    end

end