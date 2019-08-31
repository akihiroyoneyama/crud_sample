class UsersController < ApplicationController
  # 一覧画面に対応するアクション
  def index
    @users = User.all
  end
  # 新規作成画面に対応するアクション（newアクション）
  def new
    @user = User.new
  end

  # 新規登録するためのアクション(クリエイトアクション)
  def create
    User.create(user_params)
  end

  # 編集画面に対応するアクション
  def edit
    @user = User.find(params[:id])
  end

  # 更新を行うためのアクション
  def update
    user = User.find(params[:id])
    user.update(user_params)
  end

  # 削除をするためのアクション
  def destroy
    user = User.find(params[:id])
    user.delete
  end

  # データベースに登録するデータを制限する処理
  # userに紐づいたnameとageを登録する記述（nameとage以外は受け付けなくする）
  # .requireメソッドがデータのオブジェクト名を定め、.permitメソッドで変更を加えられる（保存の処理ができる）キーを指定
  private

  def user_params
    params.require(:user).permit(:name, :age)
  end
end
