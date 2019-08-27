class MobfriendsController < ApplicationController
  before_action :set_mobfriends, only: [:index]
  before_action :set_mobfriend, only: [:show]

  # CREATE: new (form) & create
  def new
  end

  def create
  end

  # READ: index & show
  def index
  end

  def show
  end

  # UPDATE: edit (form) & update
  def edit
  end

  def update
  end

  # DELETE: destroy
  def destroy
  end

  private

  def set_mobfriends
    @mobfriends = Mobfriend.all
  end

  def set_mobfriend
    @mobfriend = Mobfriend.find(params[:id])
  end
end
