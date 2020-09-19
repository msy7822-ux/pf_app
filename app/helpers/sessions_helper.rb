module SessionsHelper
    
    # 引数に渡されたユーザーでログインする
    def log_in(user)
        session[:user_id] = user.id
    end
    
    # 現在ログインしているユーザーを返す
    def current_user
    #   if session[:user_id]
    #       User.find_by(id: session[user_id]) 
    #   end
        if @current_user.nil? 
           @current_user = User.find_by(id: session[:user_id])
       else
           @current_user
        end
    end
    
    # 特定のユーザーがログインしているかどうかを判別する
    def log_in?
        !current_user.nil?
        # 上記のcurrent_userはモジュールのメソッドのこと
    end
    
    # 現在のログインユーザーをログアウトする
    def log_out
       session.delete(:user_id)
       @current_user = nil
    end
end
