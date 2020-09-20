class UsersController < ApplicationController
  
  
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
  
  def show
    @user = User.find(params[:id])
  end
  
  
  private 
  def user_params
    params.require(:user).permit(:name, :email, :univ_name, :password, :password_confirmation)
  end
end
