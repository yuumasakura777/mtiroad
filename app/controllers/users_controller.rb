class UsersController < ApplicationController
    
    
    #before_actionを実行するアクションだけ定義
    #ログインしていないユーザーがログインページにアクセスできない
    before_action :authenticate_user,{only:[:log]}
    
    #ログインしているユーザーが新規作成ページに行けないようにする
    before_action :forbid_login_user,{only:[:new,:login_form,:index]}
    
    
    
    
    
    
    def index
        
    end
    
    def new
        #全データを取得
        @user=User.new
        
        
        
    end
    
    def create
        #データを受け取る
        @user=User.create(name: params[:name],email: params[:email],password: params[:password])
        
        #登録成功と失敗で条件分岐
        if @user.save
            flash[:notice] = "新規会員登録しました。"
            redirect_to "/login"
        else
            #入力値初期値の設定
            @name=params[:name]
            @email=params[:email]
            @password=params[:password]
            flash[:false] = "ユーザー登録に失敗しました"
            render "new"
        end
    end

    
    def login_form
        #@user=User.new
        
        
    end
    
    def login
        #登録されているユーザーを見つける
        @user=User.find_by(email: params[:email],password: params[:password])
        
        #userが存在する場合としない場合の処理
        if @user
            #ログインしたユーザーの情報を保持
            session[:user_id]=@user.id
            
            flash[:notice]="ログインしました"
            redirect_to "/log"
        else
            #エラーメッセージ
            @error_message="メールアドレスまたはパスワードが間違っています"
            
            #入力値の初期値の設定
            @email=params[:email]
            @password=params[:password]
            
            render("users/login_form")
            
        end
    end
    
    def log
        
    end
    
    def logout
        #nilを代入しsessionを値を空にする
        session[:user_id]=nil
        flash[:notice]="ログアウトしました"
        redirect_to("/login")
        
    end
    
end
