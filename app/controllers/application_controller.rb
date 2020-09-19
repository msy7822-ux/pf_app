class ApplicationController < ActionController::Base
    # sessions helperの読み込み
    protect_from_forgery with: :exception
    include SessionsHelper
    # ログインやログアウトの機能をまとめてモジュール化しそれを随時使うというスタンス
end
