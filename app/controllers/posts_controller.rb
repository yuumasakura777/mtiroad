class PostsController < ApplicationController
    
    #ページネーションのページ数
    PER=30
    
    
    #before_actionを実行するアクションだけ定義
    #ログインしていないユーザーがログインページにアクセスできない
    before_action :authenticate_user,{only:[:show,:edit]}
    
    
    
    
    #テキスト一覧ページ
    #一覧取得&ページネーション処理
    def show
        @posts=Post.page(params[:page]).per(PER)
       
        @user=User.all
    end
    
    def ecreate
        
    end
    
    #テキスト投稿処理
    def kcreate
        #作成したデータを受け取る
        @post=Post.create(body: params["post"]["body"],user_id: @current_user.id)
        
        #送信成功と失敗で条件分岐
        if @post.save
            redirect_to "/show"
        else
            render "show"
        end
        
        
    end
    
    def edit
        @post=Post.find(params["id"])
        
    end
    
    def update
        post=Post.find(params["id"])
        post.body=params["post"]["body"]
        post.save
        redirect_to "/show"
    end
    
    def destroy
        post=Post.find(params["id"])
        post.destroy
        redirect_to "/show"
    end
    
    def ensure_correct_user
        @post = Post.find_by(id:params[:id])
        if @post.user_id != @current_user.id
          flash[:notice] = "権限がありません"
          redirect_to("/posts/index")
        end
    end
        
        
        
    
    
end
