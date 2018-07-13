class EpicenterController < ApplicationController
  def feed

    @currusertweets_array = current_user.tweets
    @curruserfollowing = current_user.following.count
    @following_tweets = []
    @followers = 0
    User.all.each do |user|
      if user.following.include?(current_user.id)
        @followers += 1
      end
    end
  	Tweet.all.each do |tweet|  
  		if current_user.following.include?(tweet.user_id) || current_user.id == tweet.user_id
  			@following_tweets.push(tweet)
  		end
  	end
  end

  def tag_tweets
    @tag = Tag.find(params[:id])
  end

  def all_users
    @users = User.all
  end


  def show_user
  	@user = User.find(params[:id])
    @totaltweets_array = []
    @totaltweets_array = @user.tweets
    @userfollowing = @user.following.count
    @userfollower_array = []
    @userfollowers = 0
    User.all.each do |user|
      if user.following.include?(@user.id)
        @userfollowers += 1
      end
    end

  end

  def now_following

  # We are adding the user.id of the user you want to 
  # follow to your following array.
  # and we want to make sure it's saved in there as an integer
  current_user.following.push(params[:id].to_i)
  current_user.save

  redirect_to show_user_path(id: params[:id])

  end

  def unfollow

  current_user.following.delete(params[:id].to_i)
  current_user.save
# We get this tag fromt the tweets_helper statement at end id=
  redirect_to all_users_path
  end

  def following
    @user = User.find(params[:id])
    @users = []

    User.all.each do |user|
      if @user.following.include?(user.id)
        @users.push(user)
      end
  end
  end

  def followers
    @user = User.find(params[:id])
    @users = []

    User.all.each do |user|
      if user.following.include?(@user.id)
        @users.push(user)
      end
  end
  end



end






