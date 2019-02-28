class RanksController < ApplicationController
    
    #before_actionを実行するアクションだけ定義
    #ログインしていないユーザーがログインページにアクセスできない
    before_action :authenticate_user,{only:[:rank1,:rank2,:rank3,:rank4,:rank5]}
    
    #ログインしているユーザーが新規作成ページ、ログインページ、ホームに行けないようにする
    before_action :forbid_login_user,{only:[:new,:login_form,:index]}
    
    
    
    
    
    
    def rank1
        
    end
    
    def rank2
        
    end
    
    def rank3
        
    end
    
    def rank4
        
    end
    
    def rank5
        
    end
    
end
