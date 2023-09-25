class FindFriendsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where.not(id: [current_user.friend_ids]).where.not(id: current_user.id).paginate(page: params[:page])

    respond_to do |format|
      format.js
      format.html
    end
  end
end
