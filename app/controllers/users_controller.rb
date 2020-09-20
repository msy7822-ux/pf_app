class UsersController < ApplicationController
  # before_actionメソッドはそのコントローラー内の何らかの処理が実行される直前に特定のメソッドを実行するという仕組み
  before_action :logged_in_user, only: [:edit, :update]
  # 特定のユーザーが別のユーザーのプロフィールなどを不正に編集したりするのを防ぐ
  before_action :correct_user, only: [:edit, :update]
  
  
  def new
    # 新規にUser登録する際には必ず空のUserオブジェクトを作成しておく必要がある
    # form_forの引数としてuserオブジェクトが必要になる
    @user = User.new
  end
  
  def create
    @user = User.new(user_params) # params[:user]のuserシンボルの引数は、form_forの引数で渡された@userを受け取っているということ？
    
    if @user.save
      # 保存が成功したときの処理をここに記述
      flash[:success] = "アカウント作成に成功しました"
      log_in(@user)
      redirect_to user_url(@user)
    else 
      render 'users/new'
    end 
  end
  
  def show
    @user = User.find(user_params)
  end
  
  # ユーザー情報を編集するページを表示するアクション
  def edit 
    @user = User.find(params[:id])
  end
  
  # ユーザー情報の更新を行うアクション
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      # 更新に成功したときの処理を記述
      flash[:success] = 'プロフィールの更新に成功しました'
      redirect_to user_url(@user)
    else
      render 'edit'
    end
  end
  
  
  
  private 
  def user_params
    params.require(:user).permit(:name, :email, :univ_name, :password, :password_confirmation)
  end
  
  
  # ログインして済みのユーザーかどうか
  def logged_in_user
    if !log_in?
      flash[:danger] = 'ユーザーログインが必要です'
      session_location
      redirect_to login_url
    end
  end
  
  # 正しいユーザーアカウントかどうか確認する
  def correct_user
    @user = User.find(params[:id])
    if @user != current_user
      flash[:danger] = '他のユーザーアカウントです'
      redirect_to root_url
    end
  end
end
