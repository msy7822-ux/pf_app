class SessionsController < ApplicationController
  
  # ログインフォーム表示のアクション
  def new
  end
  
  # ログインを実行するアクション
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in(user) 
      flash[:success] = "ログインに成功しました"
      redirect_back_or(user)
    else
      # エラーメッセージを表示する
      flash.now[:danger] = 'メールアドレスまたはパスワードが誤っています'
      render 'new'
    end 
  end
  
  # ログアウトを実行するアクション
  def destroy
    log_out
    flash[:success] = "ログアウトしました"
    redirect_to root_url
  end
end
