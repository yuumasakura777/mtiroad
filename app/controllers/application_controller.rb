class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  #共通処理
  before_action :set_current_user
  
  #全コントローラーでset_current_user定義
  def set_current_user
      @current_user=User.find_by(id: session[:user_id])
  end
  
  #ユーザー認証メソッド共通化
  def authenticate_user
      if @current_user==nil
         flash[:notic]="ログインが必要です"
         redirect_to("/login")
      end
  end
  
  #ログインユーザーを禁止する処理
  def forbid_login_user
      if @current_user
         flash[:notice]="すでにログインしています"
         redirect_to("/log")
      end
  end
  
  
  
   
    
end
