class SessionsController < ApplicationController
 # ログインページ
  def new
  end

# セッション（ログイン）作成  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #　ログイン後にuser情報ページにリダイレクトします。
      log_in user
      redirect_to user
    else
      # ここにエラーメッセジ用のflashをいれる。
     flash.now[:danger] = "認証に失敗しました。"
     render :new
    end
    
  end
  
# セッション（ログアウト）削除
  def destroy
    log_out
    flash[:success] = "ログアウトしました。"
    redirect_to root_url
  end
  
end
