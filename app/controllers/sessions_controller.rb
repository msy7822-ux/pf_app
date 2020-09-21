class SessionsController < ApplicationController
  
  # ログインフォーム表示のアクション
  def new
  end
  
  # ログインを実行するアクション
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      flash[:success] = 'ログインに成功しました'
      log_in(user) 
      redirect_back_or(user)
    else
      # エラーメッセージを表示する
      flash.now[:danger] = 'Invalid Email / Password combination.'
      render 'new'
    end 
  end
  
  # ログアウトを実行するアクション
  def destroy
    log_out
    redirect_to root_url
  end
end
