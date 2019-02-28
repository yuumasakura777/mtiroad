class User < ApplicationRecord
    
    #入力チェック
    
    
   validates :name,
   presence:{message:"・ユーザー名を入力してください",class:"errorMessage"},
   length:{maximum:10,message:"・ユーザー名を10文字以下で入力してください",class:"errorMessage"}
   
    
   validates :email,
   presence:{message:"・メールアドレスを入力してください",id:"presence",class:"errorMessage"},
   length:{minimum:8,maximum:30,message:"・メールアドレスを8文字以上30文字以下で入力してください",class:"errorMessage"},
   format:{ with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,message:"・メールアドレスを半角英数字でxxxxx@xxxx.xxの形で入力してください",class:"errorMessage"}
   
   validates :password,
   presence:{message:"・パスワードを入力してください",class:"errorMessage"},
   length:{minimum:8,maximum:20,message:"・パスワードを8文字以上20文字以下で入力してください",class:"errorMessage"},
   format: {with:/\A[a-z0-9]+\z/,message: "・半角英数字で入力してください",class:"errorMessage"}
   
   
    
end
