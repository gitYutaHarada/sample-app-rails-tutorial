class SessionsController < ApplicationController
  def new
  end

  # ログインページでname,email,passwordを送信したときに呼ばれるアクション
  def create
    # フォームから送信されたemailを小文字に変換してデータベースから該当するユーザを探す
    user = User.find_by(email: params[:session][:email].downcase)

    # ユーザが存在し、かつパスワードが正しければログイン成功
    # ログイン前にアクセスしようとしていたURLを取得
    # セッションIDを乗っ取っていると攻撃者がそのセッションIDを使用して被害者のアカウントにログインできてしまうので、セッションIDをリセットする
    # remember_me チェックボックスの値に応じて、ユーザを記憶するかどうかを決定
    # ユーザをログインさせる
    # 元のURLにリダイレクト、元のURLがなければユーザのプロフィールページにリダイレクト
    if user && user.authenticate(params[:session][:password])
      forwarding_url = session[:forwarding_url]
      reset_session
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      log_in user
      redirect_to forwarding_url || user

    # ログイン失敗
    # フラッシュメッセージにエラーメッセージを設定
    # ログインフォームを再表示、HTTPステータスコードとして422 Unprocessable Entityを返す
    else
      flash.now[:danger] = "Invalid email/password combination"
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url, status: :see_other
  end
end
