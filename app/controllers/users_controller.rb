class UsersController < ApplicationController
<<<<<<< HEAD
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
=======
>>>>>>> parent of 4f19f15... これ一旦消します
  
  
  def new
    # 新規にUser登録する際には必ず空のUserオブジェクトを作成しておく必要がある
    # form_forの引数としてuserオブジェクトが必要になる
    @user = User.new
  end
  
  def create
    @user = User.new(user_params) # params[:user]のuserシンボルの引数は、form_forの引数で渡された@userを受け取っているということ？
    
    if @user.save
      # 保存が成功したときの処理をここに記述
      flash[:success] = "Welcome to the Circlindex Web site"
      redirect_to user_url(@user)
    else 
      render 'users/new'
    end 
  end
  
  def edit
    @user = User.find(params[:id])
  end 
  

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      # 更新の処理に成功した時の処理
      flash[:success] = "プロフィールの更新に成功しました"
      redirect_to user_url(@user)
    else
        render 'edit'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  

  private 
  def user_params
    params.require(:user).permit(:name, :email, :univ_name, :password, :password_confirmation, :image_url)
  end

  # before アクション
  def logged_in_user
    if log_in? != true
      store_location
      flash[:danger] = "ログインしてください"
      redirect_to login_url
    end
  end
  
  def correct_user
    @user = User.find(params[:id])
    if @user != current_user
      flash[:danger] = "別のユーザアカウントです"
      redirect_to root_url
    end 
  end
end
