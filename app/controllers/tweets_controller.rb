class TweetsController < ApplicationController
  #require 'byebug'; byebug
  def index
    @tweets = Tweet.includes(:user).order('created_at DESC')
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
      flash[:notice] = "ツイートを送信しました。"
    else
      redirect_to new_tweet_path
      flash[:alert] = "ツイートに失敗しました。"
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to root_path
      flash[:notice] = "編集内容を保存しました。"
    else
      render :edit
      flash[:alert] = "保存が失敗しました。"
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to root_path, notice: '削除しました'
  end

  private
    def tweet_params
      params.require(:tweet).permit(:text, :description, :tag_lis, :picture).merge(user_id: current_user.id)
    end
end
